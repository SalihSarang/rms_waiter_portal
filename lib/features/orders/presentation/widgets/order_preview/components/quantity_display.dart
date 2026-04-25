import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class QuantityDisplay extends StatelessWidget {
  final int quantity;

  const QuantityDisplay({super.key, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      child: Center(
        child: Text(
          '$quantity',
          style: const TextStyle(
            color: TextColors.primary,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
