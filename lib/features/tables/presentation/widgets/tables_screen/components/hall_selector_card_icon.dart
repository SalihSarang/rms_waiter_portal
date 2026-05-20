import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class HallSelectorCardIcon extends StatelessWidget {
  const HallSelectorCardIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: PrimaryColors.defaultColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.table_restaurant_rounded,
        color: PrimaryColors.defaultColor,
        size: 20,
      ),
    );
  }
}
