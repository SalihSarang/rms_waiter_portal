import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';
import 'package:rms_shared_package/models/menu_models/category_model/category_model.dart';
import '../../bloc/menu/menu_bloc.dart';
import '../../bloc/menu/menu_state.dart';
import '../../bloc/menu_filter/menu_filter_cubit.dart';
import '../menue_page/category_filters/category_filters.dart';
import '../menue_page/menu_grid/menu_grid.dart';
import '../menue_page/menu_search_bar.dart';
import '../../pages/food_details_page.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// [MenueBody] coordinates the searching, filtering, and grid display for the menu.
class MenueBody extends StatelessWidget {
  const MenueBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        final isLoading = state is MenuLoading;
        final isError = state is MenuError;
        final foods = state is MenuLoaded ? state.foods : <FoodModel>[];
        final categories = state is MenuLoaded
            ? state.categories
            : <CategoryModel>[];

        if (isError) {
          return Center(
            child: Text(
              'Error: ${state.message}',
              style: const TextStyle(color: NeutralColors.white),
            ),
          );
        }

        return Column(
          children: [
            // SEARCH SECTION: Always visible, even during loading.
            MenuSearchBar(
              onChanged: (query) =>
                  context.read<MenuFilterCubit>().setSearchQuery(query),
            ),
            // CATEGORY SECTION: Lists categories or shows empty/loading state.
            CategoryFilters(
              categories: categories,
              onCategorySelected: (categoryId) =>
                  context.read<MenuFilterCubit>().setCategory(categoryId),
            ),
            const SizedBox(height: 16),
            // ITEMS SECTION: Shows skeletons if loading, otherwise the items grid.
            Expanded(
              child: MenuGrid(
                allFoods: foods,
                isLoading: isLoading,
                onFoodTap: (food) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (innerContext) =>
                          FoodDetailsPage(foodId: food.id!),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
