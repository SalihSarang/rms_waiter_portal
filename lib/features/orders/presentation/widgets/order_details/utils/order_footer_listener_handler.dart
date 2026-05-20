import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../../bloc/order/order_bloc.dart';
import '../../../bloc/order/order_event.dart';
import '../../../bloc/order/order_state.dart';

class OrderFooterListenerHandler {
  static void handleState(BuildContext context, OrderState state) {
    if (state is OrderSuccess) {
      RmsSnackbar.show(
        context,
        message: state.message ?? 'Order updated successfully!',
        type: RmsSnackbarType.success,
      );
      // Pop the order details page to show the updated status in the list
      Navigator.of(context).pop();
      // Reset order state to initial
      context.read<OrderBloc>().add(ResetOrder());
    } else if (state is OrderError) {
      RmsSnackbar.show(
        context,
        message: state.message,
        type: RmsSnackbarType.error,
      );
    }
  }
}
