import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/cart/cart_bloc.dart';
import 'order_submit_button.dart';

/// [OrderPreviewFooter] manages the the final 'Send to Kitchen' and 'Add More Items' buttons.
class OrderPreviewFooter extends StatelessWidget {
  const OrderPreviewFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartBloc>().state;

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
