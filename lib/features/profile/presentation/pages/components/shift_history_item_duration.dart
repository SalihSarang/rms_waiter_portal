import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

/// Displays the total worked duration for a specific shift session.
class ShiftHistoryItemDuration extends StatelessWidget {
  final ShiftSession session;

  const ShiftHistoryItemDuration({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          ShiftUtils.formatMinutes(session.workedMinutes),
          style: const TextStyle(
            color: PrimaryColors.brandGreen,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'WORKED',
          style: TextStyle(
            color: NeutralColors.icon,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
