import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// [SeatSelectionHeader] is a widget that displays the title and instructions
/// for the seat selection screen.
///
/// It contains a main title "Select Number of Guests" and a subtitle
/// "How many people are seated at this table?".
class SeatSelectionHeader extends StatelessWidget {
  const SeatSelectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Select Number of\nGuests',
            style: TextStyle(
              color: TextColors.primary,
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
      ),
    );
  }
}
