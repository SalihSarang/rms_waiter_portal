import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../bloc/food_details/food_details_cubit.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/cart/cart_event.dart';

class AddToOrderButton extends StatelessWidget {
  const AddToOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    final hasSelectedPortion =
        context.watch<FoodDetailsCubit>().state.selectedPortion != null;
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          final cubit = context.read<FoodDetailsCubit>();
          if (cubit.validateSelections()) {
            final state = cubit.state;
            final food = state.food!;

            final cartItem = CartItemModel(
              foodId: food.id!,
              name: food.name,
              imageUrl: food.imageUrl,
              quantity: state.quantity,
              price: state.selectedPortion!.price,
              selectedPortion: state.selectedPortion,
              selectedAddOns: state.selectedAddOns,
              specialInstructions: state.specialInstructions,
            );

            context.read<CartBloc>().add(AddCartItemEvent(cartItem));
            Navigator.pop(context);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: SemanticColors.info,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add to Order',
              style: TextStyle(
                color: TextColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (!hasSelectedPortion)
              const Text(
                'Select options',
                style: TextStyle(
                  color: TextColors.primary,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
