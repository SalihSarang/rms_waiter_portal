import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/cart/cart_state.dart';
import 'order_preview_empty_state.dart';
import 'order_preview_list.dart';
import 'order_preview_footer.dart';
import 'order_total_row.dart';

/// [OrderPreviewBody] handles the core logic and displays either the empty state or the list of items.
class OrderPreviewBody extends StatelessWidget {
  const OrderPreviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state.items.isEmpty) {
          return const OrderPreviewEmptyState();
        }

        return Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  OrderPreviewList(items: state.items),
                  const SizedBox(height: 16),
                  OrderTotalRow(total: state.cartTotal),
                ],
              ),
            ),
            OrderPreviewFooter(cartState: state),
          ],
        );
      },
    );
  }
}
