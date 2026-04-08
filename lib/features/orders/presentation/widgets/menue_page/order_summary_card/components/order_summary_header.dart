import 'package:flutter/material.dart';
import 'order_item_count_badge.dart';
import 'order_price_section.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Builds the top row of the card containing summary info.
class OrderSummaryHeader extends StatelessWidget {
  final int itemCount;
  final double cartTotal;
  final String tableNumber;

  const OrderSummaryHeader({
    super.key,
    required this.itemCount,
    required this.cartTotal,
    required this.tableNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OrderItemCountBadge(count: itemCount),
        const SizedBox(width: 16),
        const Text(
          'Order Summary',
          style: TextStyle(
            color: NeutralColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        OrderPriceSection(total: cartTotal, tableNumber: tableNumber),
      ],
    );
  }
}
