import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/cart/cart_bloc.dart';
import '../../../bloc/cart/cart_state.dart';
import 'components/order_summary_container.dart';
import 'components/order_summary_header.dart';
import 'components/view_order_button.dart';

/// [OrderSummaryCard] is a floating UI component that provides a real-time summary
/// of the items currently added to the waiter's digital order.
///
/// It displays:
/// 1. **Total Item Count**: Indicating how many items are currently in the cart.
/// 2. **Current Total**: The calculated subtotal of all items.
/// 3. **Table Context**: The specific table number this order is being prepared for.
/// 4. **Action Button**: A prominent "VIEW ORDER" button to navigate to the detailed order view.
///
/// This widget listens to [CartBloc] for its data and updates reactively.
class OrderSummaryCard extends StatelessWidget {
  /// The table identifier (e.g., "12") to display on the card.
  final String tableNumber;

  /// Callback triggered when the 'VIEW ORDER' button is pressed.
  final VoidCallback onViewOrder;

  const OrderSummaryCard({
    super.key,
    required this.tableNumber,
    required this.onViewOrder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state.items.isEmpty) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          child: OrderSummaryContainer(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OrderSummaryHeader(
                  itemCount: state.itemCount,
                  cartTotal: state.cartTotal,
                  tableNumber: tableNumber,
                ),
                const SizedBox(height: 4),
                ViewOrderButton(onPressed: onViewOrder),
              ],
            ),
          ),
        );
      },
    );
  }
}
