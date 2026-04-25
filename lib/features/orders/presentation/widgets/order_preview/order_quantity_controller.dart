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

  const OrderQuantityController({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
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
