import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Builds the circular badge showing the number of items.
class OrderItemCountBadge extends StatelessWidget {
  final int count;

  const OrderItemCountBadge({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: PrimaryColors.defaultColor,
        shape: BoxShape.circle,
      ),
      child: Text(
        '$count',
        style: const TextStyle(
          color: NeutralColors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
