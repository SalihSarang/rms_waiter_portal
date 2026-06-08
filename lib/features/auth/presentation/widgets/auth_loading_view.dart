import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A simple loading view used by AuthGate during state transitions.
class AuthLoadingView extends StatelessWidget {
  const AuthLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: NeutralColors.background,
      body: Center(
        child: CircularProgressIndicator(color: PrimaryColors.defaultColor),
      ),
    );
  }
}
