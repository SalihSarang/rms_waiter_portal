import 'package:flutter/material.dart';
import '../../../../auth/presentation/bloc/auth_bloc/auth_state.dart';
import '../../bloc/shift_state.dart';
import 'shift_action_button.dart';
import 'shift_logout_button.dart';

/// The central content of the shift toggle view, combining the action and logout buttons.
class ShiftToggleContent extends StatelessWidget {
  final ShiftState state;
  final Authenticated authState;

  const ShiftToggleContent({
    super.key,
    required this.state,
    required this.authState,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShiftActionButton(state: state, authState: authState),
        ShiftLogoutButton(state: state, authState: authState),
      ],
    );
  }
}
