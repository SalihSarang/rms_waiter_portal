import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../bloc/cart/cart_bloc.dart';
import '../bloc/order/order_bloc.dart';
import '../bloc/order/order_state.dart';
import '../widgets/order_preview/order_preview_app_bar.dart';
import '../widgets/order_preview/order_preview_footer.dart';
import '../widgets/order_preview/order_preview_listener.dart';
import '../widgets/order_preview/order_preview_body.dart';

class OrderPreviewPage extends StatelessWidget {
  const OrderPreviewPage({super.key});

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
    final isEmpty = context.select((CartBloc bloc) => bloc.state.items.isEmpty);
    final cartState = context.watch<CartBloc>().state;
    final orderState = context.watch<OrderBloc>().state;

    final List<CartItemModel> originalItems =
        orderState is OrderInProgress ? orderState.order.orderedMenu : [];

    final isModified = _isCartModified(originalItems, cartState.items);

    return OrderPreviewListener(
      child: Scaffold(
        backgroundColor: NeutralColors.background,
        appBar: const OrderPreviewAppBar(),
        body: OrderPreviewBody(isEmpty: isEmpty),
        bottomNavigationBar:
            (isEmpty || !isModified) ? null : const OrderPreviewFooter(),
      ),
    );
  }
}
