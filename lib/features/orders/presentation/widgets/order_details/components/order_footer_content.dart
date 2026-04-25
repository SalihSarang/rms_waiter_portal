import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'send_to_kitchen_button.dart';
import 'order_action_row.dart';
import 'cancel_order_button.dart';

class OrderFooterContent extends StatelessWidget {
  final OrderModel order;
  final bool showSendToKitchen;
  final bool hasNewItems;
  final bool canSendToKitchen;
  final bool canAddMore;

  const OrderFooterContent({
    super.key,
    required this.order,
    required this.showSendToKitchen,
    required this.hasNewItems,
    required this.canSendToKitchen,
    required this.canAddMore,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Send to Kitchen Button
          if (showSendToKitchen)
            SendToKitchenButton(
              order: order,
              hasNewItems: hasNewItems,
              canSendToKitchen: canSendToKitchen,
            ),

          // Bottom Action Row
          OrderActionRow(order: order, canAddMore: canAddMore),

          // Cancel Order Button
          CancelOrderButton(order: order),
        ],
      ),
    );
  }
}
