import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../shift/presentation/bloc/shift_bloc.dart';
import '../../../shift/presentation/bloc/shift_event.dart';
import '../../../shift/presentation/bloc/shift_state.dart';
import 'profile_action_button.dart';
import '../utils/profile_utils.dart';

class ProfileActionSection extends StatelessWidget {
  const ProfileActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    if (authState is! Authenticated) return const SizedBox.shrink();

    final staffId = authState.staff.id;
    final shiftState = context.watch<ShiftBloc>().state;

    String durationText = '';
    if (shiftState is ShiftActive) {
      durationText = ' (${ProfileUtils.calculateDuration(shiftState.startTime)})';
    }

    return Column(
      children: [
        if (shiftState is ShiftActive) ...[
          ProfileActionButton(
            icon: Icons.timer_off_outlined,
            label: 'End Shift$durationText',
            backgroundColor: NeutralColors.surface,
            onTap: () {
              context.read<ShiftBloc>().add(EndShiftEvent(staffId));
            },
          ),
        ] else ...[
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
        ProfileActionButton(
          icon: Icons.logout_rounded,
          label: shiftState is ShiftActive ? 'End Shift$durationText & Logout' : 'Logout',
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
