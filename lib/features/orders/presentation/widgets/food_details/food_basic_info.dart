import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class FoodBasicInfo extends StatelessWidget {
  final String name;
  final String description;

  const FoodBasicInfo({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            color: TextColors.primary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(
            color: NeutralColors.icon,
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
