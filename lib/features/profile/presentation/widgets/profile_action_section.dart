import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../shift/presentation/bloc/shift_bloc.dart';
import '../../../shift/presentation/bloc/shift_event.dart';
import '../../../shift/presentation/bloc/shift_state.dart';
import 'profile_action_button.dart';
import '../utils/profile_utils.dart';

/// Action buttons for ending the shift or logging out.
class ProfileActionSection extends StatelessWidget {
  final ShiftState shiftState;
  final String staffId;

  const ProfileActionSection({
    super.key,
    required this.shiftState,
    required this.staffId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (shiftState is ShiftActive) ...[
          // BUTTON: End Shift
          ProfileActionButton(
            icon: Icons.timer_off_outlined,
            label:
                'End Shift (${ProfileUtils.calculateDuration((shiftState as ShiftActive).startTime)})',
            backgroundColor: NeutralColors.surface,
            onTap: () {
              context.read<ShiftBloc>().add(EndShiftEvent(staffId));
            },
          ),
        ] else ...[
          // BUTTON: Start Shift
          ProfileActionButton(
            icon: Icons.timer_outlined,
            label: 'Start Shift',
            backgroundColor: NeutralColors.surface,
            onTap: () {
              context.read<ShiftBloc>().add(StartShiftEvent(staffId));
            },
          ),
        ],
        const SizedBox(height: 16),

        // BUTTON: Logout (Ends shift if active)
        ProfileActionButton(
          icon: Icons.logout_rounded,
          label: shiftState is ShiftActive
              ? 'End Shift (${ProfileUtils.calculateDuration((shiftState as ShiftActive).startTime)}) & Logout'
              : 'Logout',
          backgroundColor: SemanticColors.error,
          onTap: () {
            if (shiftState is ShiftActive) {
              context.read<ShiftBloc>().add(EndShiftEvent(staffId));
            }
            context.read<AuthBloc>().add(SignOutEvent());
          },
        ),
      ],
    );
  }
}
