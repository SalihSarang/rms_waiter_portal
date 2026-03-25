import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../shift/presentation/bloc/shift_bloc.dart';
import '../../../shift/presentation/bloc/shift_state.dart';
import 'profile_header.dart';
import 'profile_stats_row.dart';
import 'profile_personal_section.dart';
import 'profile_action_section.dart';
import 'profile_version_footer.dart';
import '../utils/profile_utils.dart';

/// A widget that manages the nested state of both [AuthBloc] and [ShiftBloc].
/// It builds the profile UI sections once the user is authenticated.
class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        // Fallback for cases where staff data isn't yet available.
        if (authState is! Authenticated) {
          return const Center(child: CircularProgressIndicator());
        }

        final staff = authState.staff;

        return BlocBuilder<ShiftBloc, ShiftState>(
          builder: (context, shiftState) {
            String shiftStartTime = '--:--';
            String shiftDuration = '0h 0m';

            // Extract dynamic shift timing info if a shift session is active.
            if (shiftState is ShiftActive) {
              shiftStartTime = ProfileUtils.formatTime(shiftState.startTime);
              shiftDuration = ProfileUtils.calculateDuration(
                shiftState.startTime,
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
                  // IDENTITY: Name, Role, Avatar, ID
                  ProfileHeader(
                    name: staff.name,
                    role: ProfileUtils.formatRole(staff.role.name),
                    staffId: '#${staff.id.substring(staff.id.length - 4)}',
                    shiftStartTime: shiftStartTime,
                    imageUrl: staff.avatar.isNotEmpty ? staff.avatar : null,
                    isActive: staff.isActive,
                  ),
                  const SizedBox(height: 32),

                  // STATS: Live shift duration and daily sales summary
                  ProfileStatsRow(
                    shiftTime: shiftDuration,
                    todayOrders: '\$142.50',
                  ),
                  const SizedBox(height: 32),

                  // OPTIONS: Navigational menu items (Personal Settings/Support)
                  const ProfilePersonalSection(),
                  const SizedBox(height: 32),

                  // ACTIONS: Shift management and account logout
                  ProfileActionSection(
                    shiftState: shiftState,
                    staffId: staff.id,
                  ),
                  const SizedBox(height: 48),

                  // FOOTER: Application version information
                  const ProfileVersionFooter(),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
