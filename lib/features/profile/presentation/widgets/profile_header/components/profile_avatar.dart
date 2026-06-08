import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Displays the user's avatar with an optional active status indicator.
class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final bool isActive;

  const ProfileAvatar({super.key, this.imageUrl, this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: NeutralColors.border,
          backgroundImage: imageUrl != null && imageUrl!.isNotEmpty
              ? NetworkImage(imageUrl!)
              : null,
          child: imageUrl == null || imageUrl!.isEmpty
              ? const Icon(Icons.person, size: 38, color: NeutralColors.icon)
              : null,
        ),
        // INDICATOR: Online/Active Badge
        if (isActive)
          Positioned(
            bottom: 2,
            right: 2,
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: StatusColors.ready,
                shape: BoxShape.circle,
                border: Border.all(color: NeutralColors.background, width: 3),
              ),
            ),
          ),
      ],
    );
  }
}
