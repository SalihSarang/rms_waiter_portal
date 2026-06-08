import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// The leading icon indicator for a shift history session item.
class ShiftHistoryItemIcon extends StatelessWidget {
  const ShiftHistoryItemIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: PrimaryColors.defaultColor.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.access_time_rounded,
        color: PrimaryColors.defaultColor,
        size: 20,
      ),
    );
  }
}
