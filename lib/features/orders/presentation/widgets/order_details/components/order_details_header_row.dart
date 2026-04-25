import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class OrderDetailsHeaderRow extends StatelessWidget {
  final String orderId;

  const OrderDetailsHeaderRow({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const RmsAppBarTitle('Order Details'),
        Text(
          '# ${orderId.toUpperCase()}',
          style: const TextStyle(
            color: NeutralColors.icon,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
