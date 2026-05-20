import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../bloc/cart/cart_state.dart';
import '../../bloc/order/order_bloc.dart';
import '../../bloc/order/order_state.dart';
import 'order_submit_components.dart';

/// [OrderSubmitButton] is a state-aware button group that triggers order submission or adding items.
class OrderSubmitButton extends StatelessWidget {
  final CartState cartState;

  const OrderSubmitButton({super.key, required this.cartState});

  bool _isCartModified(
    List<CartItemModel> originalItems,
    List<CartItemModel> currentItems,
  ) {
    if (originalItems.length != currentItems.length) return true;

    for (final currentItem in currentItems) {
      bool foundMatch = false;
      for (final originalItem in originalItems) {
        if (originalItem.foodId == currentItem.foodId &&
            originalItem.selectedPortion?.name ==
                currentItem.selectedPortion?.name &&
            originalItem.specialInstructions ==
                currentItem.specialInstructions) {
          // Compare add-ons
          if (originalItem.selectedAddOns.length ==
              currentItem.selectedAddOns.length) {
            final names1 = originalItem.selectedAddOns
                .map((e) => e.name)
                .toList()
              ..sort();
            final names2 = currentItem.selectedAddOns
                .map((e) => e.name)
                .toList()
              ..sort();
            bool addOnsMatch = true;
            for (int i = 0; i < names1.length; i++) {
              if (names1[i] != names2[i]) {
                addOnsMatch = false;
                break;
              }
            }
            if (addOnsMatch && originalItem.quantity == currentItem.quantity) {
              foundMatch = true;
              break;
            }
          }
        }
      }
      if (!foundMatch) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        final isLoading = state is OrderLoading;

        final List<CartItemModel> originalItems =
            state is OrderInProgress ? state.order.orderedMenu : [];

        final isModified = _isCartModified(originalItems, cartState.items);

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isModified)
              SendToKitchenButton(isLoading: isLoading, cartState: cartState),
          ],
        );
      },
    );
  }
}
