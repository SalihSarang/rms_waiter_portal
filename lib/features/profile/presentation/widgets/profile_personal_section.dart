import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'profile_menu_item.dart';

/// The "PERSONAL" section with menu items for profile editing and support.
class ProfilePersonalSection extends StatelessWidget {
  const ProfilePersonalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PERSONAL',
          style: TextStyle(
            color: NeutralColors.icon,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        ProfileMenuItem(
          icon: Icons.person_outline,
          title: 'Edit Profile Information',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.help_outline,
          title: 'Help & Support',
          onTap: () {},
        ),
      ],
    );
  }
}
