import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'order_details_header_row.dart';
import 'order_details_table_info.dart';

class OrderDetailsInfoColumn extends StatelessWidget {
  final OrderModel order;

  const OrderDetailsInfoColumn({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderDetailsHeaderRow(orderId: order.id),
          const SizedBox(height: 4),
          // Bottom Row: Table & Waiter
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OrderDetailsTableInfo(tableNumber: order.tableNumber),
              Text(
                'Waiter: ${order.staffName.isEmpty ? 'Unknown' : order.staffName}',
                style: const TextStyle(
                  color: NeutralColors.icon,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
