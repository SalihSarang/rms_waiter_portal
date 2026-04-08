import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A header widget that displays user identifiers including their avatar,
/// name, primary role, staff ID, and the shift start time.
class ProfileHeader extends StatelessWidget {
  final String name;
  final String role;
  final String staffId;
  final String shiftStartTime;
  final String? imageUrl;
  final bool isActive;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.role,
    required this.staffId,
    required this.shiftStartTime,
    this.imageUrl,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // WIDGET: User Avatar & Status Indicator
        Stack(
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor: NeutralColors.border,
              backgroundImage: imageUrl != null
                  ? NetworkImage(imageUrl!)
                  : null,
              child: imageUrl == null
                  ? const Icon(
                      Icons.person,
                      size: 45,
                      color: NeutralColors.icon,
                    )
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
                    border: Border.all(
                      color: NeutralColors.background,
                      width: 3,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 20),

        // COLUMN: User Identity Information
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // TEXT: User Name
                  Text(
                    name,
                    style: const TextStyle(
                      color: NeutralColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // WIDGET: "ACTIVE" Label Badge
                  if (isActive)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: StatusColors.ready.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: StatusColors.ready.withValues(alpha: 0.2),
                        ),
                      ),
                      child: const Text(
                        'ACTIVE',
                        style: TextStyle(
                          color: StatusColors.ready,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 6),
              // TEXT: Role & Staff ID
              Text(
                '$role • ID $staffId',
                style: const TextStyle(color: NeutralColors.icon, fontSize: 14),
              ),
              const SizedBox(height: 6),
              // TEXT: Shift Timing Info
              Text(
                'Shift started at $shiftStartTime',
                style: const TextStyle(color: NeutralColors.icon, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
