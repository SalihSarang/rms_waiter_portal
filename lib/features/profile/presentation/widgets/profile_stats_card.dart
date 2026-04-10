import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// An internal reusable component for displaying a single metric in a stylized card.
class ProfileStatsCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;

  const ProfileStatsCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: NeutralColors.background.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // ICON: Metric Type Visual
              Icon(icon, size: 14, color: iconColor),
              const SizedBox(width: 6),
              // TEXT: Metric Identification Label
              Text(
                label,
                style: TextStyle(
                  color: iconColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // TEXT: Computed Metric Value
          Text(
            value,
            style: const TextStyle(
              color: NeutralColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
