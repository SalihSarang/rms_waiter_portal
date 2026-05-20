import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class OrderItemSpecialInstructions extends StatelessWidget {
  final String? instructions;

  const OrderItemSpecialInstructions({super.key, this.instructions});

  @override
  Widget build(BuildContext context) {
    if (instructions == null || instructions!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        'Note: $instructions',
        style: const TextStyle(
          color: SemanticColors.info,
          fontSize: 12,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
