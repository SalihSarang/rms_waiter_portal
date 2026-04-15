import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';
import '../../bloc/menu/menu_bloc.dart';
import '../../bloc/menu/menu_state.dart';
import '../../bloc/menu_filter/menu_filter_cubit.dart';
import '../../bloc/menu_filter/menu_filter_state.dart';
import '../../pages/food_details_page.dart';
import 'menu_grid/components/menu_items_view.dart';
import 'menu_grid/components/menu_loading_view.dart';

/// [MenuSection] is a self-contained widget that handles the display of the menu items.
/// It includes its own Expanded wrapper and manages loading, error, and filtering logic.
class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, menuState) {
          if (menuState is MenuError) {
            return Center(
              child: Text(
                'Error: ${menuState.message}',
                style: const TextStyle(color: NeutralColors.white),
              ),
            );
          }

          final isLoading = menuState is MenuLoading;
          final foods = menuState is MenuLoaded
              ? menuState.foods
              : <FoodModel>[];

          if (isLoading) {
            return const MenuLoadingView();
          }

          return BlocBuilder<MenuFilterCubit, MenuFilterState>(
            builder: (context, filterState) {
              var filteredFoods = foods;

              // 1. Filter by category
              if (filterState.selectedCategoryId != 'All') {
                filteredFoods = filteredFoods
                    .where(
                      (food) =>
                          food.category.id == filterState.selectedCategoryId,
                    )
                    .toList();
              }

              // 2. Filter by search query (Name or ID)
              if (filterState.searchQuery.isNotEmpty) {
                final query = filterState.searchQuery.toLowerCase();
                filteredFoods = filteredFoods.where((food) {
                  return food.name.toLowerCase().contains(query) ||
                      (food.id?.toLowerCase().contains(query) ?? false);
                }).toList();
              }

              return MenuItemsView(
                foods: filteredFoods,
                onFoodTap: (food) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (innerContext) =>
                          FoodDetailsPage(foodId: food.id!),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
