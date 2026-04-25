import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

/// Displays the date and time window for a specific shift session.
class ShiftHistoryItemTime extends StatelessWidget {
  final ShiftSession session;

  const ShiftHistoryItemTime({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            session.dateKey,
            style: const TextStyle(
              color: TextColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            ShiftUtils.formatSessionWindow(session),
            style: const TextStyle(color: NeutralColors.icon, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
