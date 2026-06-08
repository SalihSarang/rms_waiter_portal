import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'shift_history_card.dart';

/// A scrollable list displaying shift history session records.
class ShiftHistoryListView extends StatelessWidget {
  final List<ShiftSession> history;

  const ShiftHistoryListView({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: history.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return ShiftHistoryCard(session: history[index]);
      },
    );
  }
}
