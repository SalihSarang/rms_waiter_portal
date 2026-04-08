import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart/cart_state.dart';
import '../../bloc/order/order_bloc.dart';
import '../../bloc/order/order_state.dart';
import 'order_submit_components.dart';

/// [OrderSubmitButton] is a state-aware button group that triggers order submission or adding items.
class OrderSubmitButton extends StatelessWidget {
  final CartState cartState;

  const OrderSubmitButton({super.key, required this.cartState});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        final isLoading = state is OrderLoading;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SendToKitchenButton(isLoading: isLoading, cartState: cartState),
            const SizedBox(height: 12),
            AddMoreItemsButton(isLoading: isLoading),
          ],
        );
      },
    );
  }
}
