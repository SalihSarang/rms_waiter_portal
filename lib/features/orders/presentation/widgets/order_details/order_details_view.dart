import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:waiter_portal/core/widgets/rms_shimmer.dart';
import '../order_preview/order_total_row.dart';
import 'order_details_list.dart';

class OrderDetailsView extends StatelessWidget {
  final OrderModel order;

  const OrderDetailsView({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return ShimmerScope(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          OrderDetailsList(items: order.orderedMenu),
          const SizedBox(height: 24),
          OrderTotalRow(total: order.totalAmount),
        ],
      ),
    );
  }
}
