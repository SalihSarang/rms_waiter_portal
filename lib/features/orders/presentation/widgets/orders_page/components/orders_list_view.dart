import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No active orders',
        style: TextStyle(
          color: NeutralColors.icon,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
