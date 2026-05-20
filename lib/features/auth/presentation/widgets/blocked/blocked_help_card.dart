import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class BlockedHelpCard extends StatelessWidget {
  const BlockedHelpCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: NeutralColors.border.withValues(alpha: 0.1)),
      ),
      child: const Column(
        children: [
          Text(
            'Need help?',
            style: TextStyle(
              color: TextColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Please contact your restaurant manager to re-activate your account.',
            style: TextStyle(color: TextColors.secondary, fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
