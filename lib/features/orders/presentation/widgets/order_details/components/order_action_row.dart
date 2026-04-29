import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'add_more_button.dart';
import 'edit_order_button.dart';
import 'request_bill_button.dart';

class OrderActionRow extends StatelessWidget {
  final OrderModel order;
  final bool canAddMore;

  const OrderActionRow({
    super.key,
    required this.order,
    required this.canAddMore,
  });

  @override
  Widget build(BuildContext context) {
    final showAddMore = order.orderStatus == OrderStatus.pending ||
        order.orderStatus == OrderStatus.served;
    final showEditOrder = order.orderStatus == OrderStatus.pending ||
        order.orderStatus == OrderStatus.served;
    final showRequestBill = order.orderStatus == OrderStatus.served;

    final List<Widget> visibleButtons = [];

    if (showAddMore) {
      visibleButtons.add(AddMoreButton(order: order, canAddMore: showAddMore));
    }
    if (showEditOrder) {
      visibleButtons.add(EditOrderButton(order: order, canEdit: showEditOrder));
    }
    if (showRequestBill) {
      visibleButtons.add(RequestBillButton(order: order));
    }

    if (visibleButtons.isEmpty) {
      return const SizedBox.shrink();
    }

    if (visibleButtons.length == 3) {
      return Column(
        children: [
          Row(
            children: [
              visibleButtons[0],
              const SizedBox(width: 12),
              visibleButtons[1],
            ],
          ),
          const SizedBox(height: 12),
          Row(children: [visibleButtons[2]]),
        ],
      );
    }

    return Row(
      children: visibleButtons.expand((widget) sync* {
        if (widget != visibleButtons.first) {
          yield const SizedBox(width: 12);
        }
        yield widget;
      }).toList(),
    );
  }
}
