import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// [GuestCountButton] is a UI component used to display a selectable guest count.
///
/// It features an [AnimatedContainer] that visually changes (color, shadow)
/// based on the [isSelected] state, providing haptic feedback through animation.
class GuestCountButton extends StatelessWidget {
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  const GuestCountButton({
    super.key,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected
              ? PrimaryColors.defaultColor
              : NeutralColors.surface,
          borderRadius: BorderRadius.circular(15),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: PrimaryColors.defaultColor.withValues(alpha: 0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        alignment: Alignment.center,
        child: Text(
          count.toString(),
          style: TextStyle(
            color: isSelected ? TextColors.primary : NeutralColors.icon,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
