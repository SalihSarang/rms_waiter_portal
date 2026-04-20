import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/bottom_nav/presentation/pages/main_screen.dart';
import '../bloc/auth_bloc/auth_state.dart';

class AuthListeners {
  static void onAuthStateChanged(BuildContext context, AuthState state) {
    if (state is AuthError) {
      RmsSnackbar.show(
        context,
        message: state.message,
        type: RmsSnackbarType.error,
      );
    } else if (state is Authenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const BottomNav()),
      );
    }
  }
}
