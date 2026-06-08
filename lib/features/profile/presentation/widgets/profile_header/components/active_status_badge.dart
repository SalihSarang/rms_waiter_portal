import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A small labeled badge used to indicate an "ACTIVE" status.
class ActiveStatusBadge extends StatelessWidget {
  const ActiveStatusBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: StatusColors.ready.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: StatusColors.ready.withValues(alpha: 0.2)),
      ),
      child: const Text(
        'ACTIVE',
        style: TextStyle(
          color: StatusColors.ready,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
