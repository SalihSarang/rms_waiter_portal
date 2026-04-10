import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../../../../shift/presentation/bloc/shift_bloc.dart';
import '../../../../../shift/presentation/bloc/shift_state.dart';
import '../../../../../orders/presentation/bloc/orders/orders_bloc.dart';
import '../../../../../orders/presentation/bloc/orders/orders_state.dart';
import '../../../utils/profile_utils.dart';
import 'profile_content_scroll_view.dart';

/// A sub-view that manages the shift and order data logic, then builds the content.
class ProfileDetailsView extends StatelessWidget {
  final StaffModel staff;

  const ProfileDetailsView({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftBloc, ShiftState>(
      builder: (context, shiftState) {
        String shiftStartTime = '--:--';
        String shiftDuration = '0h 0m';

        // Extract dynamic shift timing info if a shift session is active.
        if (shiftState is ShiftActive) {
          shiftStartTime = ProfileUtils.formatTime(shiftState.startTime);
          shiftDuration = ProfileUtils.calculateDuration(shiftState.startTime);
        }

        return BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, ordersState) {
            String todaySales = '\$0.00';

            if (ordersState is OrdersLoaded) {
              todaySales = ProfileUtils.calculateTodaySales(
                ordersState.orders,
                staff.id,
              );
            }

            return ProfileContentScrollView(
              staff: staff,
              shiftStartTime: shiftStartTime,
              shiftDuration: shiftDuration,
              todaySales: todaySales,
              shiftState: shiftState,
            );
          },
        );
      },
    );
  }
}
