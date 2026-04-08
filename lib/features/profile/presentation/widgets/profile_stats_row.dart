import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'profile_stats_card.dart';

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
        border: Border.all(color: NeutralColors.border.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          // CARD: Shift Duration Info
          Expanded(
            child: ProfileStatsCard(
              icon: Icons.access_time_filled,
              label: 'SHIFT TIME',
              value: shiftTime,
              iconColor: Colors.blueAccent,
            ),
          ),
          const SizedBox(width: 8),
          // CARD: Today's Orders Total Price
          Expanded(
            child: ProfileStatsCard(
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
