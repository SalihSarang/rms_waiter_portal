import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/cart/cart_event.dart';
import '../../bloc/order/order_bloc.dart';
import '../../bloc/order/order_event.dart';
import '../../bloc/order/order_state.dart';

/// [OrderPreviewListener] handles the logic for the order submission success/error.
/// It provides a [BlocListener] for the [OrderBloc].
class OrderPreviewListener extends StatelessWidget {
  final Widget child;

  const OrderPreviewListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is OrderSuccess) {
          RmsSnackbar.show(
            context,
            message: 'Order placed successfully!',
            type: RmsSnackbarType.success,
          );
          // Clear cart and reset order state, then go back to dashboard
          context.read<CartBloc>().add(ClearCartEvent());
          context.read<OrderBloc>().add(ResetOrder());
          Navigator.of(context).popUntil((route) => route.isFirst);
        } else if (state is OrderError) {
          RmsSnackbar.show(
            context,
            message: state.message,
            type: RmsSnackbarType.error,
          );
        }
      },
      child: child,
    );
  }
}
