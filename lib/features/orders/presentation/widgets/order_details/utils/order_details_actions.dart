import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../../bloc/order/order_bloc.dart';
import '../../../bloc/order/order_event.dart';
import '../../orders_page/order_card/components/order_confirm_dialog.dart';

class OrderDetailsActions {
  static void showCancelConfirmation(BuildContext context, OrderModel order) {
    showOrderConfirmationDialog(
      context,
      title: 'Cancel Order',
      message:
          'Are you sure you want to cancel this order? This action cannot be undone.',
      onConfirm: () {
        context.read<OrderBloc>().add(CancelOrder(order: order));
      },
    );
  }

  static void showRequestBillConfirmation(
      BuildContext context, OrderModel order) {
    showOrderConfirmationDialog(
      context,
      title: 'Request Bill',
      message: 'Are you sure you want to request the bill for this order?',
      onConfirm: () {
        context.read<OrderBloc>().add(RequestBill(order.id));
      },
    );
  }
}
