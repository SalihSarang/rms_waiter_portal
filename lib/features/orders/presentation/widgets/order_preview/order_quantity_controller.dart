import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/cart/cart_event.dart';

/// [OrderQuantityController] is a UI component for adjusting item quantities in the cart.
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
        GestureDetector(
          onTap: () {
            context.read<CartBloc>().add(
              UpdateCartItemQuantityEvent(item, item.quantity - 1),
            );
          },
          child: Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: NeutralColors.border,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.remove,
              color: NeutralColors.icon,
              size: 16,
            ),
          ),
        ),
        SizedBox(
          width: 32,
          child: Center(
            child: Text(
              '${item.quantity}',
              style: const TextStyle(
                color: TextColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<CartBloc>().add(
              UpdateCartItemQuantityEvent(item, item.quantity + 1),
            );
          },
          child: Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: PrimaryColors.defaultColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: TextColors.primary, size: 16),
          ),
        ),
      ],
    );
  }
}
