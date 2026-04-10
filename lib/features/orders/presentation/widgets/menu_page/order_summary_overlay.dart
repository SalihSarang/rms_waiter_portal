import 'package:flutter/material.dart';
import 'menu_navigation.dart';
import 'order_summary_card/order_summary_card.dart';

/// [OrderSummaryOverlay] wraps the [OrderSummaryCard] with floating positioning and navigation logic.
/// It uses the [MenuNavigation] mixin for cleaner navigation logic.
class OrderSummaryOverlay extends StatelessWidget with MenuNavigation {
  final String tableNumber;

  const OrderSummaryOverlay({super.key, required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: OrderSummaryCard(
        tableNumber: tableNumber,
        onViewOrder: () => navigateToPreview(context),
      ),
    );
  }
}
