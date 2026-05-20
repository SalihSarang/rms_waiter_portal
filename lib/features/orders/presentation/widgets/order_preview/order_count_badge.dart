import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class OrderCountBadge extends StatelessWidget {
  final int count;

  const OrderCountBadge({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: TextColors.primary.withAlpha(51),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '$count',
        style: const TextStyle(
          color: TextColors.primary,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
