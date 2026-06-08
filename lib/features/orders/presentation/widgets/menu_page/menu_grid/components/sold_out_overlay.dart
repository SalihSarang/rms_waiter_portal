import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// [SoldOutOverlay] provides a semi-transparent shading and distinctive "Sold Out" badge.
class SoldOutOverlay extends StatelessWidget {
  const SoldOutOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: NeutralColors.shadow.withValues(alpha: 0.4),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: SemanticColors.error.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Sold Out',
              style: TextStyle(
                color: TextColors.primary,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
