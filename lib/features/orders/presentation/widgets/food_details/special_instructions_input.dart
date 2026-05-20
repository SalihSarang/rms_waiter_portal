import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/food_details/food_details_cubit.dart';

class SpecialInstructionsInput extends StatelessWidget {
  const SpecialInstructionsInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Special Instructions',
          style: TextStyle(
            color: TextColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          onChanged: (v) =>
              context.read<FoodDetailsCubit>().updateSpecialInstructions(v),
          style: const TextStyle(color: TextColors.primary, fontSize: 14),
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Add notes for the kitchen (e.g. no onions)...',
            hintStyle: TextStyle(
              color: TextColors.primary.withValues(alpha: 0.3),
              fontSize: 14,
            ),
            filled: true,
            fillColor: NeutralColors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            suffixIcon: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(
                Icons.edit_outlined,
                size: 20,
                color: NeutralColors.icon,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
