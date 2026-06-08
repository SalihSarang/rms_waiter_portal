import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart/cart_state.dart';
import '../../bloc/order/order_bloc.dart';
import '../../bloc/order/order_event.dart';
import 'order_loading_indicator.dart';
import 'order_button_content.dart';

export 'add_more_items_button.dart';
export 'order_loading_indicator.dart';
export 'order_button_content.dart';
export 'order_count_badge.dart';

class SendToKitchenButton extends StatelessWidget {
  final bool isLoading;
  final CartState cartState;

  const SendToKitchenButton({
    super.key,
    required this.isLoading,
    required this.cartState,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : () {
                context.read<OrderBloc>().add(
                  SubmitOrder(
                    items: cartState.items,
                    cartTotal: cartState.cartTotal,
                  ),
                );
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: PrimaryColors.defaultColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          disabledBackgroundColor: PrimaryColors.defaultColor.withAlpha(128),
        ),
        child: isLoading
            ? const OrderLoadingIndicator()
            : OrderButtonContent(itemCount: cartState.itemCount),
      ),
    );
  }
}
