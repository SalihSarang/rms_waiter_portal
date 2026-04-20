import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/cart/cart_state.dart';
import 'order_preview_list.dart';
import 'order_total_row.dart';

class OrderPreviewContent extends StatelessWidget {
  const OrderPreviewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            OrderPreviewList(items: state.items),
            const SizedBox(height: 16),
            OrderTotalRow(total: state.cartTotal),
          ],
        );
      },
    );
  }
}
