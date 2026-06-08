import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/food_details/food_details_cubit.dart';

import 'portion_error_message.dart';
import 'portion_item.dart';

class PortionSelector extends StatelessWidget {
  const PortionSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FoodDetailsCubit>().state;
    final food = state.food;

    if (food == null) return const SizedBox.shrink();

    final portions = food.portions;
    final selectedPortion = state.selectedPortion;
    final showError = state.showPortionError;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Portion Size',
              style: TextStyle(
                color: TextColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 4),
            Text(
              '*',
              style: TextStyle(color: SemanticColors.error, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (showError && selectedPortion == null) const PortionErrorMessage(),
        ...portions.map(
          (portion) => PortionItem(
            portion: portion,
            isSelected: selectedPortion == portion,
            onTap: () =>
                context.read<FoodDetailsCubit>().selectPortion(portion),
          ),
        ),
      ],
    );
  }
}
