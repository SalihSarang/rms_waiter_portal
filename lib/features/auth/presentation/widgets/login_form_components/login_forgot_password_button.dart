import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class LoginForgotPasswordButton extends StatelessWidget {
  const LoginForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Forgot password?',
          style: TextStyle(
            color: PrimaryColors.defaultColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
