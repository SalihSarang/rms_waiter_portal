import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'active_status_badge.dart';

/// Displays the user's name, role, and shift information.
class ProfileInfoColumn extends StatelessWidget {
  final String name;
  final String role;
  final bool isActive;

  const ProfileInfoColumn({
    super.key,
    required this.name,
    required this.role,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TEXT: User Name
            Flexible(
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: TextColors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // WIDGET: "ACTIVE" Label Badge
            if (isActive) const ActiveStatusBadge(),
          ],
        ),
        const SizedBox(height: 4),
        // TEXT: Role
        Text(
          role,
          style: const TextStyle(color: NeutralColors.icon, fontSize: 14),
        ),
      ],
    );
  }
}
