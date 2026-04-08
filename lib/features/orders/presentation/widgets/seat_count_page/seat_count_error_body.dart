import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// [SeatCountErrorBody] is a widget displayed when the table capacity is invalid (<= 0).
///
/// It shows an error icon, the invalid capacity value, and instructions to contact a manager.
class SeatCountErrorBody extends StatelessWidget {
  final int capacity;

  const SeatCountErrorBody({super.key, required this.capacity});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: SemanticColors.error,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            'Invalid Table Capacity ($capacity)',
            style: const TextStyle(color: NeutralColors.white, fontSize: 18),
          ),
          const SizedBox(height: 8),
          const Text(
            'Please contact a manager to check the capacity setup.',
            style: TextStyle(color: NeutralColors.icon, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
