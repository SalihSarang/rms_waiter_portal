import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../../shift/presentation/bloc/shift_bloc.dart';
import '../../../shift/presentation/bloc/shift_state.dart';
import 'profile_stats_card.dart';

class ProfileStatsRow extends StatelessWidget {
  const ProfileStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final shiftData = context.watch<ShiftBloc>().state.data;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: NeutralColors.border.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: StreamBuilder<int>(
              stream: Stream<int>.periodic(
                const Duration(minutes: 1),
                (count) => count,
              ),
              builder: (context, snapshot) {
                return ProfileStatsCard(
                  icon: Icons.access_time_filled,
                  label: 'WORKED / BREAK',
                  value:
                      '${shiftData?.workedLabel ?? '0h 0m'} / ${shiftData?.pauseLabel ?? '0h 0m'}',
                  iconColor: Colors.blueAccent,
                );
              },
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ProfileStatsCard(
              icon: Icons.badge_outlined,
              label: 'STATUS',
              value: shiftData?.statusLabel ?? 'Not Started',
              iconColor: Colors.amberAccent,
            ),
          ),
        ],
      ),
    );
  }
}
