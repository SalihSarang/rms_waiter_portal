import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'portion_radio_indicator.dart';

class PortionItem extends StatelessWidget {
  final PortionAndPrice portion;
  final bool isSelected;
  final VoidCallback onTap;

  const PortionItem({
    super.key,
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
                PortionRadioIndicator(isSelected: isSelected),
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
}
