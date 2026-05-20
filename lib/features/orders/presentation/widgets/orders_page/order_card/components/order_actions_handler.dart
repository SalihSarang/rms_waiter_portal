import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../../../pages/order_details_page.dart';
import '../../../../bloc/orders/orders_bloc.dart';
import '../../../../bloc/orders/orders_event.dart';
import 'order_confirm_dialog.dart';

class OrderActionsHandler {
  static void navigateToDetails(BuildContext context, OrderModel order) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderDetailsPage(order: order)),
    );
  }

  static void onServePressed(BuildContext context, OrderModel order) {
    showOrderConfirmationDialog(
      context,
      title: 'Serve Order',
      message: 'Are you sure you want to mark this order as served?',
      onConfirm: () {
        context.read<OrdersBloc>().add(
          UpdateOrderStatusEvent(
            orderId: order.id,
            newStatus: OrderStatus.served,
          ),
        );
      },
    );
  }

  static void onCheckoutPressed(BuildContext context, OrderModel order) {
    showOrderConfirmationDialog(
      context,
      title: 'Checkout Order',
      message: 'Are you sure you want to checkout this order?',
      onConfirm: () {
        context.read<OrdersBloc>().add(
          UpdateOrderStatusEvent(
            orderId: order.id,
            newStatus: OrderStatus.completed,
            tableId: order.tableId,
            seatCount: order.seatCount,
          ),
        );
      },
    );
  }
}
