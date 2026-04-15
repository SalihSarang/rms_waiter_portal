import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class BlockedHeroSection extends StatelessWidget {
  const BlockedHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(Icons.block_flipped, size: 80, color: SemanticColors.error),
        SizedBox(height: 32),
        Text(
          'Account Blocked',
          style: TextStyle(
            color: TextColors.primary,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Text(
          'Your account has been deactivated by the manager. You no longer have access to the Waiter Portal.',
          style: TextStyle(
            color: TextColors.secondary,
            fontSize: 16,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
