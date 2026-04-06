import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

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
          color: isSelected ? PrimaryColors.defaultColor : const Color(0xFF1D222B),
          borderRadius: BorderRadius.circular(15),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: PrimaryColors.defaultColor.withValues(alpha: 0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        alignment: Alignment.center,
        child: Text(
          count.toString(),
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[400],
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
