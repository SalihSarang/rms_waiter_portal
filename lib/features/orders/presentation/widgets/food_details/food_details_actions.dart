import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/food_details/food_details_cubit.dart';

class QuantityActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const QuantityActionButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: NeutralColors.white, size: 20),
    );
  }
}

class AddToOrderButton extends StatelessWidget {
  final bool hasSelectedPortion;

  const AddToOrderButton({super.key, required this.hasSelectedPortion});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          if (context.read<FoodDetailsCubit>().validateSelections()) {
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
                color: NeutralColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (!hasSelectedPortion)
              const Text(
                'Select options',
                style: TextStyle(
                  color: NeutralColors.white,
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
