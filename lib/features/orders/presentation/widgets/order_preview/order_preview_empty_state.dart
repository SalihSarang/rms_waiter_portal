import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// [OrderPreviewEmptyState] displays a message to the user when the order is empty.
class OrderPreviewEmptyState extends StatelessWidget {
  const OrderPreviewEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Your cart is empty.',
        style: TextStyle(color: NeutralColors.icon, fontSize: 16),
      ),
    );
  }
}
