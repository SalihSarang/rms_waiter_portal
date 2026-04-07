import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'order_count_badge.dart';

class OrderButtonContent extends StatelessWidget {
  final int itemCount;

  const OrderButtonContent({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const HugeIcon(
          icon: HugeIcons.strokeRoundedSent,
          color: NeutralColors.white,
          size: 20,
        ),
        const SizedBox(width: 8),
        const Text(
          'Send to Kitchen',
          style: TextStyle(
            color: NeutralColors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 16),
        OrderCountBadge(count: itemCount),
      ],
    );
  }
}
