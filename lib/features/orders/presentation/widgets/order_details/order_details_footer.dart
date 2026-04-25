import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/order/order_bloc.dart';
import '../../bloc/order/order_state.dart';
import 'components/order_footer_content.dart';
import 'utils/order_details_decorations.dart';
import 'utils/order_footer_listener_handler.dart';
import 'utils/order_footer_logic.dart';

class OrderDetailsFooter extends StatelessWidget {
  final OrderModel order;

  const OrderDetailsFooter({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final logic = OrderFooterLogic(order);

    return BlocListener<OrderBloc, OrderState>(
      listener: OrderFooterListenerHandler.handleState,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: OrderDetailsDecorations.footerDecoration,
        child: OrderFooterContent(
          order: order,
          showSendToKitchen: logic.showSendToKitchen,
          hasNewItems: logic.hasNewItems,
          canSendToKitchen: logic.canSendToKitchen,
          canAddMore: logic.canAddMore,
        ),
      ),
    );
  }
}
