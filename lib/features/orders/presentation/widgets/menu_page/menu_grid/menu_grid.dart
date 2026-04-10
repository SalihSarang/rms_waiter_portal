import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/menu_filter/menu_filter_state.dart';
import '../../../bloc/menu_filter/menu_filter_cubit.dart';
import 'components/menu_items_view.dart';
import 'components/menu_loading_view.dart';

/// [MenuGrid] is the main orchestrator for the menu items display.
///
/// Its primary responsibilities are:
/// 1. **State Management**: Handling the switch between loading and loaded states.
/// 2. **Data Transformation**: Filtering the raw item list based on search and categories.
/// 3. **View Delegation**: Delegating the actual grid rendering to specialized components.
///
class MenuGrid extends StatelessWidget {
  final List<FoodModel> allFoods;
  final bool isLoading;
  final ValueChanged<FoodModel>? onFoodTap;

  const MenuGrid({
    super.key,
    required this.allFoods,
    this.isLoading = false,
    this.onFoodTap,
  });

  @override
  Widget build(BuildContext context) {
    // LOADING STATE: Delegates to a skeleton grid view.
    if (isLoading) {
      return const MenuLoadingView();
    }

    return BlocBuilder<MenuFilterCubit, MenuFilterState>(
      builder: (context, state) {
        // FILTERING LOGIC: Transfrom the data before passing it to the view.
        var filteredFoods = allFoods;

        // 1. Filter by category
        if (state.selectedCategoryId != 'All') {
          filteredFoods = filteredFoods
              .where((food) => food.category.id == state.selectedCategoryId)
              .toList();
        }

        // 2. Filter by search query (Name or ID)
        if (state.searchQuery.isNotEmpty) {
          final query = state.searchQuery.toLowerCase();
          filteredFoods = filteredFoods.where((food) {
            return food.name.toLowerCase().contains(query) ||
                (food.id?.toLowerCase().contains(query) ?? false);
          }).toList();
        }

        // LOADED STATE: Delegates to a grid view of filtered items.
        return MenuItemsView(foods: filteredFoods, onFoodTap: onFoodTap);
      },
    );
  }
}
