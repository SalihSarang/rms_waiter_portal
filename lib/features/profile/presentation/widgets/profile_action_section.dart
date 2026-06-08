import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_bloc/auth_state.dart';
import '../../../shift/presentation/bloc/shift_bloc.dart';
import '../../../shift/presentation/bloc/shift_event.dart';
import '../../../shift/presentation/bloc/shift_state.dart';
import 'profile_action_button.dart';

import '../pages/shift_history_screen.dart';

class ProfileActionSection extends StatelessWidget {
  const ProfileActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    if (authState is! Authenticated) return const SizedBox.shrink();

    final staffId = authState.staff.id;
    final shiftState = context.watch<ShiftBloc>().state;
    final shiftData = shiftState.data;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'SHIFT CONTROLS',
              style: TextStyle(
                color: NeutralColors.icon,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShiftHistoryScreen(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: PrimaryColors.defaultColor,
                visualDensity: VisualDensity.compact,
              ),
              child: const Text(
                'View History',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (shiftData?.canStart ?? true) ...[
          ProfileActionButton(
            icon: Icons.play_arrow_rounded,
            label: 'Start Shift',
            backgroundColor: PrimaryColors.brandGreen,
            onTap: () {
              context.read<ShiftBloc>().add(StartShiftEvent(authState.staff));
            },
          ),
          const SizedBox(height: 12),
        ],
        if (shiftData?.canPause ?? false) ...[
          ProfileActionButton(
            icon: Icons.pause_rounded,
            label: 'Pause Shift',
            backgroundColor: SemanticColors.warning,
            onTap: () {
              context.read<ShiftBloc>().add(PauseShiftEvent(staffId));
            },
          ),
          const SizedBox(height: 12),
        ],
        if (shiftData?.canResume ?? false) ...[
          ProfileActionButton(
            icon: Icons.play_circle_outline_rounded,
            label: 'Resume Shift',
            backgroundColor: PrimaryColors.brandGreen,
            onTap: () {
              context.read<ShiftBloc>().add(ResumeShiftEvent(staffId));
            },
          ),
          const SizedBox(height: 12),
        ],
        if (shiftData?.canEnd ?? false) ...[
          ProfileActionButton(
            icon: Icons.stop_rounded,
            label: 'End Shift',
            backgroundColor: SemanticColors.error,
            onTap: () {
              RmsAlertDialog.show(
                context,
                title: 'End Shift',
                message: 'Are you sure you want to end your current shift?',
                type: RmsAlertDialogType.confirm,
                onConfirm: () {
                  context.read<ShiftBloc>().add(EndShiftEvent(staffId));
                },
              );
            },
          ),
        ],
      ],
    );
  }
}
