import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_design_system/app_colors/primary_colors.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Center(
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: PrimaryColors.defaultColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Icon(
                Icons.restaurant_menu,
                color: NeutralColors.white,
                size: 40,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Waiter Portal',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: TextColors.inverse,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Sign in to manage your tables',
          textAlign: TextAlign.center,
          style: TextStyle(color: TextColors.secondary, fontSize: 14),
        ),
      ],
    );
  }
}
