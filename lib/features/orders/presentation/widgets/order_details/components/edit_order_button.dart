import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../../bloc/cart/cart_bloc.dart';
import '../../../bloc/cart/cart_event.dart';
import '../../../bloc/order/order_bloc.dart';
import '../../../bloc/order/order_event.dart';
import '../../../pages/order_preview_page.dart';

class EditOrderButton extends StatelessWidget {
  final OrderModel order;
  final bool canEdit;

  const EditOrderButton({
    super.key,
    required this.order,
    required this.canEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RmsButton(
        text: 'Edit Order',
        icon: Icon(
          Icons.edit,
          size: 20,
          color: canEdit
              ? TextColors.primary
              : TextColors.primary.withValues(alpha: 0.3),
        ),
        isOutlined: true,
        onPressed: canEdit
            ? () {
                context.read<OrderBloc>().add(LoadOrder(order));
                context.read<CartBloc>().add(
                  LoadCartItemsEvent(order.orderedMenu),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderPreviewPage(),
                  ),
                );
              }
            : null,
      ),
    );
  }
}
