import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class TableSeatInfo extends StatelessWidget {
  final int availableSeats;
  final int totalSeats;
  final bool isOccupied;

  const TableSeatInfo({
    super.key,
    required this.availableSeats,
    required this.totalSeats,
    required this.isOccupied,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.people_alt_outlined,
              color: NeutralColors.icon,
              size: 16,
            ),
            const SizedBox(width: 6),
            Text(
              '$availableSeats / $totalSeats Seats',
              style: const TextStyle(color: NeutralColors.icon, fontSize: 13),
            ),
          ],
        ),
        if (isOccupied)
          const Icon(
            Icons.restaurant_rounded,
            color: SemanticColors.info,
            size: 16,
          ),
      ],
    );
  }
}
