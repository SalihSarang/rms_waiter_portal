import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/food_details/food_details_cubit.dart';
import 'food_details_actions.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final bool hasSelectedPortion;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.hasSelectedPortion,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: hasSelectedPortion ? 1.0 : 0.5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: NeutralColors.surface,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            QuantityActionButton(
              icon: Icons.remove,
              onTap: hasSelectedPortion
                  ? () => context.read<FoodDetailsCubit>().decrementQuantity()
                  : () {},
            ),
            const SizedBox(width: 16),
            Text(
              '$quantity',
              style: const TextStyle(
                color: NeutralColors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 16),
            QuantityActionButton(
              icon: Icons.add,
              onTap: hasSelectedPortion
                  ? () => context.read<FoodDetailsCubit>().incrementQuantity()
                  : () {},
            ),
          ],
        ),
      ),
    );
  }
}
