import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../shift/presentation/bloc/shift_bloc.dart';
import '../../../shift/presentation/bloc/shift_state.dart';
import '../../../orders/presentation/bloc/orders/orders_bloc.dart';
import '../../../orders/presentation/bloc/orders/orders_state.dart';
import '../utils/profile_utils.dart';
import 'profile_header/profile_header.dart';
import 'profile_stats_row.dart';
import 'profile_personal_section.dart';
import 'profile_action_section.dart';
import 'profile_version_footer.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    if (authState is! Authenticated) {
      return const Center(child: CircularProgressIndicator());
    }

    final staff = authState.staff;

    return BlocBuilder<ShiftBloc, ShiftState>(
      builder: (context, shiftState) {
        String shiftStartTime = '--:--';
        String shiftDuration = '0h 0m';

        if (shiftState is ShiftActive) {
          shiftStartTime = ProfileUtils.formatTime(shiftState.startTime);
          shiftDuration = ProfileUtils.calculateDuration(shiftState.startTime);
        }

        return BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, ordersState) {
            String todaySales = '₹0';

            if (ordersState is OrdersLoaded) {
              todaySales = ProfileUtils.calculateTodaySales(
                ordersState.orders,
                staff.id,
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileHeader(
                    name: staff.name,
                    role: ProfileUtils.formatRole(staff.role.name),
                    shiftStartTime: shiftStartTime,
                    imageUrl: staff.avatar.isNotEmpty ? staff.avatar : null,
                    isActive: staff.isActive,
                  ),
                  const SizedBox(height: 24),
                  ProfileStatsRow(
                    shiftTime: shiftDuration,
                    todayOrders: todaySales,
                  ),
                  const SizedBox(height: 24),
                  const ProfilePersonalSection(),
                  const SizedBox(height: 24),
                  ProfileActionSection(
                    shiftState: shiftState,
                    staffId: staff.id,
                  ),
                  const SizedBox(height: 30),
                  const ProfileVersionFooter(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
