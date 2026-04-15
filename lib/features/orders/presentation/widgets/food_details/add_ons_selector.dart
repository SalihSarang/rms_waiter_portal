import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/food_details/food_details_cubit.dart';
import 'add_on_item.dart';

class AddOnsSelector extends StatelessWidget {
  const AddOnsSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FoodDetailsCubit>().state;
    final food = state.food;

    if (food == null || food.addOns.isEmpty) return const SizedBox.shrink();

    final addOns = food.addOns;
    final selectedAddOns = state.selectedAddOns;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add-ons',
          style: TextStyle(
            color: NeutralColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: NeutralColors.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: addOns.map((addOn) {
              final isSelected = selectedAddOns.contains(addOn);
              return AddOnItem(
                addOn: addOn,
                isSelected: isSelected,
                onTap: () =>
                    context.read<FoodDetailsCubit>().toggleAddOn(addOn),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
