import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'add_more_button.dart';
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
    return Row(
      children: [
        AddMoreButton(order: order, canAddMore: canAddMore),
        const SizedBox(width: 12),
        RequestBillButton(order: order),
      ],
    );
  }
}
