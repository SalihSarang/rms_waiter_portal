import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class TableFilterChipContent extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const TableFilterChipContent({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: isSelected ? TextColors.primary : NeutralColors.icon,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? TextColors.primary : NeutralColors.icon,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
