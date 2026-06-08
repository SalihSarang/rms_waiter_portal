import 'package:flutter/material.dart';
import '../../utils/table_utils.dart';
import 'table_filter_chip_content.dart';

class TableFilterChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const TableFilterChip({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: TableUtils.getTableFilterChipDecoration(
            isSelected: isSelected,
          ),
          child: TableFilterChipContent(
            icon: icon,
            label: label,
            isSelected: isSelected,
          ),
        ),
      ),
    );
  }
}
