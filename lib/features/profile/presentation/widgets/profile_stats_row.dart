import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A horizontal row of cards providing summary metrics about the current shift
/// and daily order performance.
class ProfileStatsRow extends StatelessWidget {
  final String shiftTime;
  final String todayOrders;

  const ProfileStatsRow({
    super.key,
    required this.shiftTime,
    required this.todayOrders,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: NeutralColors.border.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          // CARD: Shift Duration Info
          Expanded(
            child: _StatsCard(
              icon: Icons.access_time_filled,
              label: 'SHIFT TIME',
              value: shiftTime,
              iconColor: Colors.blueAccent,
            ),
          ),
          const SizedBox(width: 8),
          // CARD: Today's Orders Total Price
          Expanded(
            child: _StatsCard(
              icon: Icons.monetization_on,
              label: "TODAY'S ORDER",
              value: todayOrders,
              iconColor: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}

/// An internal reusable component for displaying a single metric in a stylized card.
class _StatsCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;

  const _StatsCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: NeutralColors.background.withOpacity(0.5),
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
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
