import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

import 'order_action_button.dart';
import 'order_actions_handler.dart';

class OrderActionButtons extends StatelessWidget {
  final OrderModel order;

  const OrderActionButtons({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final List<Widget> buttons = [];

    // All statuses have "View Details" button
    buttons.add(
      Expanded(
        child: OrderActionButton(
          text: 'View Details',
          bgColor: NeutralColors.card,
          textColor: NeutralColors.white,
          onPressed: () =>
              OrderActionsHandler.navigateToDetails(context, order),
        ),
      ),
    );

    // Add additional action buttons based on status
    switch (order.orderStatus) {
      case OrderStatus.ready:
        buttons.add(const SizedBox(width: 12));
        buttons.add(
          Expanded(
            child: OrderActionButton(
              text: 'Serve Now',
              bgColor: StatusColors.ready,
              textColor: NeutralColors.white,
              onPressed: () =>
                  OrderActionsHandler.onServePressed(context, order),
            ),
          ),
        );
        break;

      case OrderStatus.served:
        buttons.add(const SizedBox(width: 12));
        buttons.add(
          Expanded(
            child: OrderActionButton(
              text: 'Checkout',
              bgColor: StatusColors.purpleLight,
              textColor: NeutralColors.white,
              onPressed: () =>
                  OrderActionsHandler.onCheckoutPressed(context, order),
            ),
          ),
        );
        break;

      default:
        // No extra buttons for other statuses (pending, preparing, completed)
        break;
    }

    return Row(children: buttons);
  }
}
