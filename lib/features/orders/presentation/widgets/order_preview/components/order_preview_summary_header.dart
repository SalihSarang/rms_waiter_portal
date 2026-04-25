import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class OrderPreviewSummaryHeader extends StatelessWidget {
  final String tableNumber;

  const OrderPreviewSummaryHeader({super.key, required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Order Summary',
          style: TextStyle(
            color: TextColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            const Text(
              'Table',
              style: TextStyle(
                color: TableColors.round,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              tableNumber,
              style: const TextStyle(
                color: TableColors.round,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
