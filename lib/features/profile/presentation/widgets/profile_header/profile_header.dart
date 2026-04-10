import 'package:flutter/material.dart';
import 'components/profile_avatar.dart';
import 'components/profile_info_column.dart';

/// A header widget that displays user identifiers including their avatar,
/// name, primary role, and the shift start time.
class ProfileHeader extends StatelessWidget {
  final String name;
  final String role;
  final String shiftStartTime;
  final String? imageUrl;
  final bool isActive;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.role,
    required this.shiftStartTime,
    this.imageUrl,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // COMPONENT: User Avatar & Status Indicator
        ProfileAvatar(imageUrl: imageUrl, isActive: isActive),
        const SizedBox(width: 20),

        // COMPONENT: User Information
        Expanded(
          child: ProfileInfoColumn(
            name: name,
            role: role,
            shiftStartTime: shiftStartTime,
            isActive: isActive,
          ),
        ),
      ],
    );
  }
}
