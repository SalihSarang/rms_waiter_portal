import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class SeatSelectionHeader extends StatelessWidget {
  const SeatSelectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          'Select Number of\nGuests',
          style: TextStyle(
            color: NeutralColors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'How many people are seated at this table?',
          style: TextStyle(color: NeutralColors.icon, fontSize: 14),
        ),
      ],
    );
  }
}
