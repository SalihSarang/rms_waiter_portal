import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class TotalRow extends StatelessWidget {
  final String label;
  final String value;

  const TotalRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: TextColors.primary,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: PrimaryColors.defaultColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
