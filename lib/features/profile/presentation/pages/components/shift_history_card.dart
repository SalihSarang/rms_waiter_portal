import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:waiter_portal/core/utils/app_decorations.dart';
import 'shift_history_item_duration.dart';
import 'shift_history_item_icon.dart';
import 'shift_history_item_time.dart';

/// A card displaying a single shift history session record.
class ShiftHistoryCard extends StatelessWidget {
  final ShiftSession session;

  const ShiftHistoryCard({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppDecorations.shiftHistoryCardDecoration(),
      child: Row(
        children: [
          const ShiftHistoryItemIcon(),
          const SizedBox(width: 16),
          ShiftHistoryItemTime(session: session),
          ShiftHistoryItemDuration(session: session),
        ],
      ),
    );
  }
}
