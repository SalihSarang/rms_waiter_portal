import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../../shift/presentation/bloc/shift_bloc.dart';
import '../../../shift/presentation/bloc/shift_state.dart';
import 'profile_stats_card.dart';

/// Section displaying a 2x2 grid of shift statistics.
class ProfileStatsSection extends StatelessWidget {
  const ProfileStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftBloc, ShiftState>(
      builder: (context, state) {
        final shiftData = state.data;
        final currentSession = shiftData?.currentSession;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SHIFT STATISTICS',
              style: TextStyle(
                color: NeutralColors.icon,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                ProfileStatsCard(
                  icon: Icons.access_time_rounded,
                  label: 'SHIFT START',
                  value: currentSession != null
                      ? ShiftUtils.formatTime(currentSession.actualStart)
                      : '--:--',
                  iconColor: PrimaryColors.defaultColor,
                ),
                ProfileStatsCard(
                  icon: Icons.timelapse_rounded,
                  label: 'WORKED',
                  value: shiftData?.workedLabel ?? '0h 0m',
                  iconColor: PrimaryColors.defaultColor,
                ),
                ProfileStatsCard(
                  icon: Icons.pause_circle_outline_rounded,
                  label: 'PAUSED',
                  value: shiftData?.pauseLabel ?? '0h 0m',
                  iconColor: SemanticColors.warning,
                ),
                ProfileStatsCard(
                  icon: Icons.track_changes_rounded,
                  label: 'STATUS',
                  value: shiftData?.statusLabel ?? 'Not Started',
                  iconColor: _getStatusColor(shiftData?.status),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Color _getStatusColor(ShiftStatus? status) {
    switch (status) {
      case ShiftStatus.active:
        return PrimaryColors.brandGreen;
      case ShiftStatus.paused:
        return SemanticColors.warning;
      case ShiftStatus.ended:
        return SemanticColors.error;
      default:
        return NeutralColors.icon;
    }
  }
}
