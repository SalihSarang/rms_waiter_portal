import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';

class LoginTitleSection extends StatelessWidget {
  const LoginTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Waiter Portal',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: TextColors.primary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Sign in to manage your tables',
          textAlign: TextAlign.center,
          style: TextStyle(color: TextColors.secondary, fontSize: 14),
        ),
        SizedBox(height: 48),
      ],
    );
  }
}
