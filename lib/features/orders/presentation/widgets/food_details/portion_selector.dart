import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../bloc/food_details/food_details_cubit.dart';

class PortionSelector extends StatelessWidget {
  final List<PortionAndPrice> portions;
  final PortionAndPrice? selectedPortion;
  final bool showError;

  const PortionSelector({
    super.key,
    required this.portions,
    this.selectedPortion,
    required this.showError,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Portion Size',
              style: TextStyle(
                color: NeutralColors.white,
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
        if (showError && selectedPortion == null) _buildErrorMessage(),
        ...portions.map(
          (portion) => _PortionItem(
            portion: portion,
            isSelected: selectedPortion == portion,
            onTap: () =>
                context.read<FoodDetailsCubit>().selectPortion(portion),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorMessage() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: SemanticColors.warning.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: SemanticColors.warning.withValues(alpha: 0.5),
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: SemanticColors.warning,
            size: 20,
          ),
          SizedBox(width: 12),
          Text(
            'Please select a portion',
            style: TextStyle(
              color: SemanticColors.warning,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _PortionItem extends StatelessWidget {
  final PortionAndPrice portion;
  final bool isSelected;
  final VoidCallback onTap;

  const _PortionItem({
    required this.portion,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: NeutralColors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: isSelected
                  ? SemanticColors.info.withValues(alpha: 0.1)
                  : NeutralColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected
                    ? SemanticColors.info
                    : NeutralColors.transparent,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                _buildRadioIndicator(),
                const SizedBox(width: 16),
                Text(
                  portion.name,
                  style: TextStyle(
                    color: isSelected
                        ? NeutralColors.white
                        : NeutralColors.white.withValues(alpha: 0.8),
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  '\$${portion.price}',
                  style: const TextStyle(
                    color: NeutralColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRadioIndicator() {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? SemanticColors.info : NeutralColors.icon,
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: SemanticColors.info,
                ),
              ),
            )
          : null,
    );
  }
}
