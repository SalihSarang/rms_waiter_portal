import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_design_system/app_colors/primary_colors.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';

/// A stylized bottom navigation bar with a floating appearance and semi-transparent
/// container, designed for the Waiter application.
class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // CONTAINER: Main floating bar background with rounded corners and shadow
      height: 60,
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: NeutralColors.shadow.withValues(alpha: 0.4),
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        // ROW: Center-aligned navigation items
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(0, Icons.assignment_outlined, 'Orders'),
          _buildNavItem(1, Icons.grid_view_outlined, 'Tables'),
          _buildNavItem(2, Icons.notifications_none_outlined, 'Alerts'),
          _buildNavItem(3, Icons.person_outline, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = selectedIndex == index;
    final color = isSelected
        ? PrimaryColors.defaultColor
        : TextColors.secondary;

    return GestureDetector(
      onTap: () => onItemSelected(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        // COLUMN: Nav item visual stack (Icon + Text)
        mainAxisSize: MainAxisSize.min,
        children: [
          // ICON: Navigation visual indicator
          Icon(icon, color: color, size: 18),
          const SizedBox(height: 4),
          // TEXT: Navigation label
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 8,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
