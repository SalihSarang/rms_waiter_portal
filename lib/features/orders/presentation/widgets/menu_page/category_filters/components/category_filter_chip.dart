import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/menu_models/category_model/category_model.dart';

/// [CategoryFilterChip] is a specialized interactive button for menu categories.
///
/// It visually distinguishes between the selected and unselected states using
/// the design system's semantic and neutral color tokens.
class CategoryFilterChip extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryFilterChip({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? SemanticColors
                    .info // Highlight color for active filter
              : NeutralColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? NeutralColors.transparent
                : TextColors.primary.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          category.name,
          style: TextStyle(
            color: isSelected ? TextColors.primary : NeutralColors.icon,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
