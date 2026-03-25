import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/food_details/food_details_cubit.dart';

class BottomActionBar extends StatelessWidget {
  final int quantity;
  final bool hasSelectedPortion;

  const BottomActionBar({
    super.key,
    required this.quantity,
    required this.hasSelectedPortion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: NeutralColors.background,
        border: Border(top: BorderSide(color: NeutralColors.border, width: 1)),
      ),
      child: Row(
        children: [
          _QuantitySelector(quantity: quantity),
          const SizedBox(width: 16),
          _AddToOrderButton(hasSelectedPortion: hasSelectedPortion),
        ],
      ),
    );
  }
}

class _QuantitySelector extends StatelessWidget {
  final int quantity;

  const _QuantitySelector({required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          _ActionButton(
            icon: Icons.remove,
            onTap: () => context.read<FoodDetailsCubit>().decrementQuantity(),
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
          _ActionButton(
            icon: Icons.add,
            onTap: () => context.read<FoodDetailsCubit>().incrementQuantity(),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ActionButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: NeutralColors.white, size: 20),
    );
  }
}

class _AddToOrderButton extends StatelessWidget {
  final bool hasSelectedPortion;

  const _AddToOrderButton({required this.hasSelectedPortion});

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
