import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/cart/cart_bloc.dart';
import 'order_preview_list.dart';
import 'order_total_row.dart';

/// [OrderPreviewItemsSection] encapsulates the scrollable list of cart items
/// and the total row, safely reading the state directly from CartBloc.
class OrderPreviewItemsSection extends StatelessWidget {
  const OrderPreviewItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartBloc>().state;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        OrderPreviewList(items: cartState.items),
        const SizedBox(height: 16),
        OrderTotalRow(total: cartState.cartTotal),
      ],
    );
  }
}
