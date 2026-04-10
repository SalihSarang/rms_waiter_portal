import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../../../../shift/presentation/bloc/shift_state.dart';
import '../../../utils/profile_utils.dart';
import '../../profile_header/profile_header.dart';
import '../../profile_stats_row.dart';
import '../../profile_personal_section.dart';
import '../../profile_action_section.dart';
import '../../profile_version_footer.dart';

/// The main scrollable content for the profile screen, displaying all sections.
class ProfileContentScrollView extends StatelessWidget {
  final StaffModel staff;
  final String shiftStartTime;
  final String shiftDuration;
  final String todaySales;
  final ShiftState shiftState;

  const ProfileContentScrollView({
    super.key,
    required this.staff,
    required this.shiftStartTime,
    required this.shiftDuration,
    required this.todaySales,
    required this.shiftState,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IDENTITY: Name, Role, Avatar
          ProfileHeader(
            name: staff.name,
            role: ProfileUtils.formatRole(staff.role.name),
            shiftStartTime: shiftStartTime,
            imageUrl: staff.avatar.isNotEmpty ? staff.avatar : null,
            isActive: staff.isActive,
          ),
          const SizedBox(height: 24),

          // STATS: Live shift duration and daily sales summary
          ProfileStatsRow(shiftTime: shiftDuration, todayOrders: todaySales),
          const SizedBox(height: 24),

          // OPTIONS: Navigational menu items (Personal Settings/Support)
          const ProfilePersonalSection(),
          const SizedBox(height: 24),

          // ACTIONS: Shift management and account logout
          ProfileActionSection(shiftState: shiftState, staffId: staff.id),
          const SizedBox(height: 30),

          // FOOTER: Application version information
          const ProfileVersionFooter(),
          // const SizedBox(height: 24),
        ],
      ),
    );
  }
}
