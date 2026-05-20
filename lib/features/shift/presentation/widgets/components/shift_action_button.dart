import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../../../auth/presentation/bloc/auth_bloc/auth_state.dart';
import '../../bloc/shift_bloc.dart';
import '../../bloc/shift_event.dart';
import '../../bloc/shift_state.dart';
import 'shift_action_label.dart';

/// A button that handles the main shift actions (Start/End Shift).
class ShiftActionButton extends StatelessWidget {
  final ShiftState state;
  final Authenticated authState;

  const ShiftActionButton({
    super.key,
    required this.state,
    required this.authState,
  });

  @override
  Widget build(BuildContext context) {
    final shiftData = state.data;
    final isActive = shiftData?.canEnd ?? false;
    final isLoading = state is ShiftLoading;
    final id = authState.staff.id;
    final staff = authState.staff;

    return RmsButton(
      height: 56,
      backgroundColor: NeutralColors.surface,
      borderColor: NeutralColors.border,
      onPressed: isLoading
          ? null
          : () {
              if (isActive) {
                context.read<ShiftBloc>().add(EndShiftEvent(id));
              } else if (shiftData?.canStart ?? false) {
                context.read<ShiftBloc>().add(StartShiftEvent(staff));
              }
            },
      isLoading: isLoading,
      child: ShiftActionLabel(isActive: isActive),
    );
  }
}
