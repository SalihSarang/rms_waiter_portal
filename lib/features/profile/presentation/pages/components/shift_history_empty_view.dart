import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Displayed when there are no shift history records to show.
class ShiftHistoryEmptyView extends StatelessWidget {
  const ShiftHistoryEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history_rounded,
            size: 64,
            color: NeutralColors.icon.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          const Text(
            'No shift history found',
            style: TextStyle(color: NeutralColors.icon, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
