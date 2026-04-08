import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../order_preview/order_total_row.dart';
import 'order_details_item_tile.dart';

class OrderDetailsBody extends StatelessWidget {
  final OrderModel order;

  const OrderDetailsBody({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Items List
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: order.orderedMenu.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return OrderDetailsItemTile(item: order.orderedMenu[index]);
          },
        ),
        const SizedBox(height: 24),
        // Total Section
        OrderTotalRow(total: order.totalAmount),
      ],
    );
  }
}
