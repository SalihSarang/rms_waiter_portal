import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'order_action_row.dart';
import 'cancel_order_button.dart';

class OrderFooterContent extends StatelessWidget {
  final OrderModel order;
  final bool canAddMore;

  const OrderFooterContent({
    super.key,
    required this.order,
    required this.canAddMore,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Bottom Action Row
          OrderActionRow(order: order, canAddMore: canAddMore),

          // Cancel Order Button
          if (order.orderStatus == OrderStatus.pending &&
              !order.orderedMenu.any((item) => item.isPrepared))
            CancelOrderButton(order: order),
        ],
      ),
    );
  }
}
