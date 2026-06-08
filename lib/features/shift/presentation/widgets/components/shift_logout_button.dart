import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../../../auth/presentation/bloc/auth_bloc/auth_event.dart';
import '../../../../auth/presentation/bloc/auth_bloc/auth_state.dart';
import '../../bloc/shift_bloc.dart';
import '../../bloc/shift_event.dart';
import '../../bloc/shift_state.dart';
import 'shift_logout_label.dart';

/// A button that handles the logout action, ending the shift if active.
class ShiftLogoutButton extends StatelessWidget {
  final ShiftState state;
  final Authenticated authState;

  const ShiftLogoutButton({
    super.key,
    required this.state,
    required this.authState,
  });

  @override
  Widget build(BuildContext context) {
    final shiftData = state.data;
    final isActive = shiftData?.canEnd ?? false;
    final id = authState.staff.id;

    return Column(
      children: [
        const SizedBox(height: 16),
        RmsButton(
          height: 56,
          backgroundColor: StatusColors.cancelled,
          onPressed: () {
            if (isActive) {
              context.read<ShiftBloc>().add(EndShiftEvent(id));
            }
            context.read<AuthBloc>().add(SignOutEvent());
          },
          child: ShiftLogoutLabel(isActive: isActive),
        ),
      ],
    );
  }
}
