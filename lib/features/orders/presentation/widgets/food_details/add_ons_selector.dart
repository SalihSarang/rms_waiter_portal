import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../bloc/food_details/food_details_cubit.dart';

class AddOnsSelector extends StatelessWidget {
  final List<AddOnsModel> addOns;
  final List<AddOnsModel> selectedAddOns;

  const AddOnsSelector({
    super.key,
    required this.addOns,
    required this.selectedAddOns,
  });

  @override
  Widget build(BuildContext context) {
    if (addOns.isEmpty) return const SizedBox.shrink();

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
              return _AddOnItem(
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

class _AddOnItem extends StatelessWidget {
  final AddOnsModel addOn;
  final bool isSelected;
  final VoidCallback onTap;

  const _AddOnItem({
    required this.addOn,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.check_box_rounded
                  : Icons.check_box_outline_blank_rounded,
              color: isSelected ? SemanticColors.info : NeutralColors.icon,
              size: 20,
            ),
            const SizedBox(width: 12),
            Text(
              addOn.name,
              style: const TextStyle(color: NeutralColors.white, fontSize: 14),
            ),
            const Spacer(),
            Text(
              '+\$${addOn.price}',
              style: const TextStyle(color: NeutralColors.icon, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
