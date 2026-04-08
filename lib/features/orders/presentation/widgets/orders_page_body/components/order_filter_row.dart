import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class OrderFilterRow extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;
  final List<String> filters;

  const OrderFilterRow({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
    required this.filters,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: filters.map((filter) {
          final isSelected = selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => onFilterChanged(filter),
              child: _buildFilterChip(
                filter,
                _getIconForFilter(filter),
                isSelected: isSelected,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  IconData _getIconForFilter(String filter) {
    switch (filter) {
      case 'All':
        return Icons.grid_view_rounded;
      case 'Pending':
        return Icons.pending_actions_rounded;
      case 'Preparing':
        return Icons.restaurant_rounded;
      case 'Ready':
        return Icons.done_all_rounded;
      case 'Bill Requested':
        return Icons.receipt_long_rounded;
      case 'Served':
        return Icons.check_circle_rounded;
      default:
        return Icons.filter_list_rounded;
    }
  }

  Widget _buildFilterChip(
    String label,
    IconData icon, {
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? PrimaryColors.defaultColor : NeutralColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? PrimaryColors.defaultColor : NeutralColors.border,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: isSelected ? NeutralColors.white : NeutralColors.icon,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? NeutralColors.white : NeutralColors.icon,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
