import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class OrderDetailsTableInfo extends StatelessWidget {
  final String tableNumber;

  const OrderDetailsTableInfo({super.key, required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Table',
          style: TextStyle(
            color: SemanticColors.info,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          tableNumber,
          style: const TextStyle(
            color: SemanticColors.info,
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
