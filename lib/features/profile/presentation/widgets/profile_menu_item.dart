import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A standardized clickable list item for profile navigation menus.
class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: NeutralColors.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // ICON: Leading Visual Indicator
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: NeutralColors.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.blueAccent, size: 20),
            ),
            const SizedBox(width: 16),
            // TEXT: Menu Item Title
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: NeutralColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // ICON: Trailing Navigation Arrow
            const Icon(
              Icons.chevron_right,
              color: NeutralColors.icon,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
