import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class OrderPreviewWaiterInfo extends StatelessWidget {
  final String shortCode;
  final String waiterName;

  const OrderPreviewWaiterInfo({
    super.key,
    required this.shortCode,
    required this.waiterName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '# $shortCode',
            style: const TextStyle(
              color: TextColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              const Text(
                'Waiter:',
                style: TextStyle(
                  color: NeutralColors.icon,
                  fontSize: 10,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                waiterName,
                style: const TextStyle(
                  color: NeutralColors.icon,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
