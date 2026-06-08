import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';
import '../bloc/menu_filter/menu_filter_state.dart';

class MenuUtils {
  /// Filters the provided [foods] based on the criteria in [filterState].
  ///
  /// 1. Filters by category ID (unless it's set to 'All').
  /// 2. Filters by search query (matching name or ID, case-insensitive).
  static List<FoodModel> filterFoods(
    List<FoodModel> foods,
    MenuFilterState filterState,
  ) {
    var filteredFoods = foods;

    // 1. Filter by category
    if (filterState.selectedCategoryId != 'All') {
      filteredFoods = filteredFoods
          .where((food) => food.category.id == filterState.selectedCategoryId)
          .toList();
    }

    // 2. Filter by search query
    if (filterState.searchQuery.isNotEmpty) {
      final query = filterState.searchQuery.toLowerCase();
      filteredFoods = filteredFoods.where((food) {
        return food.name.toLowerCase().contains(query) ||
            (food.id?.toLowerCase().contains(query) ?? false);
      }).toList();
    }

    return filteredFoods;
  }

  /// Returns the decoration for a category filter chip based on its selection state.
  static BoxDecoration getCategoryChipDecoration({required bool isSelected}) {
    return BoxDecoration(
      color: isSelected ? SemanticColors.info : NeutralColors.surface,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: isSelected
            ? NeutralColors.transparent
            : TextColors.primary.withValues(alpha: 0.1),
        width: 1,
      ),
    );
  }
}
