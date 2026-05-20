import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../../bloc/cart/cart_bloc.dart';
import '../../../bloc/cart/cart_event.dart';
import '../../../bloc/order/order_bloc.dart';
import '../../../bloc/order/order_event.dart';
import '../../../pages/menu_page.dart';

class AddMoreButton extends StatelessWidget {
  final OrderModel order;
  final bool canAddMore;

  const AddMoreButton({
    super.key,
    required this.order,
    required this.canAddMore,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RmsButton(
        text: 'Add More',
        icon: Icon(
          Icons.add,
          size: 20,
          color: canAddMore
              ? TextColors.primary
              : TextColors.primary.withValues(alpha: 0.3),
        ),
        isOutlined: true,
        onPressed: canAddMore
            ? () {
                // Prepare OrderBloc and CartBloc with current order data
                context.read<OrderBloc>().add(LoadOrder(order));
                context.read<CartBloc>().add(
                  LoadCartItemsEvent(order.orderedMenu),
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MenuPage(tableNumber: order.tableNumber),
                  ),
                );
              }
            : null,
      ),
    );
  }
}
