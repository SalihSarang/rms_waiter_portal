import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/cart/cart_state.dart';
import 'order_submit_button.dart';

/// [OrderPreviewFooter] manages the the final 'Send to Kitchen' and 'Add More Items' buttons.
class OrderPreviewFooter extends StatelessWidget {
  final CartState cartState;

  const OrderPreviewFooter({super.key, required this.cartState});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [OrderSubmitButton(cartState: cartState)],
        ),
      ),
    );
  }
}
