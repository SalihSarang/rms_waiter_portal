import 'package:flutter/material.dart';
import 'seat_selection_header.dart';
import 'seat_count_presets.dart';
import 'seat_count_grid.dart';

class SeatCountView extends StatelessWidget {
  final int capacity;

  const SeatCountView({super.key, required this.capacity});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SeatSelectionHeader(),
          const SeatCountPresets(),
          SeatCountGrid(capacity: capacity),
        ],
      ),
    );
  }
}
