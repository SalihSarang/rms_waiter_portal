import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A custom stylized button used for major profile actions.
class ProfileActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final VoidCallback onTap;

  const ProfileActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ICON: Action Icon
            Icon(icon, color: TextColors.primary, size: 24),
            const SizedBox(width: 12),
            // TEXT: Action Label
            Text(
              label,
              style: const TextStyle(
                color: TextColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
