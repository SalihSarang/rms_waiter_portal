import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/cart/cart_event.dart';
import 'components/quantity_action_button.dart';
import 'components/quantity_display.dart';

/// [OrderQuantityController] is a widget used in the order preview list to manage item quantities.
/// It provides (+) and (-) buttons that dispatch [UpdateCartItemQuantityEvent]s.
class OrderQuantityController extends StatelessWidget {
  final CartItemModel item;
  final OrderStatus orderStatus;

  const OrderQuantityController({
    super.key,
    required this.item,
    required this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    final bool canEditItem = !item.isSentToKitchen ||
        (orderStatus == OrderStatus.pending && !item.isPrepared);

    if (!canEditItem) {
      final String statusText = item.isPrepared ? 'Served' : 'Preparing';
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            item.isPrepared ? Icons.check_circle_outline : Icons.hourglass_empty,
            size: 16,
            color: item.isPrepared ? SemanticColors.success : SemanticColors.warning,
          ),
          const SizedBox(width: 6),
          Text(
            '${item.quantity} $statusText',
            style: TextStyle(
              color: TextColors.primary.withValues(alpha: 0.6),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Decrease Button
        QuantityActionButton(
          icon: Icons.remove,
          backgroundColor: NeutralColors.border,
          iconColor: NeutralColors.icon,
          onTap: () {
            context.read<CartBloc>().add(
              UpdateCartItemQuantityEvent(item, item.quantity - 1),
            );
          },
        ),

        // Quantity Display
        QuantityDisplay(quantity: item.quantity),

        // Increase Button
        QuantityActionButton(
          icon: Icons.add,
          backgroundColor: PrimaryColors.defaultColor,
          iconColor: TextColors.primary,
          onTap: () {
            context.read<CartBloc>().add(
              UpdateCartItemQuantityEvent(item, item.quantity + 1),
            );
          },
        ),
      ],
    );
  }
}
