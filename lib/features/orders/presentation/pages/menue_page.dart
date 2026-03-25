import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/core/di/injector.dart';
import '../bloc/menu/menu_bloc.dart';
import '../bloc/menu/menu_event.dart';
import '../bloc/menu/menu_state.dart';
import '../bloc/menu_filter/menu_filter_cubit.dart';
import '../widgets/menue_page/category_filters/category_filters.dart';
import '../widgets/menue_page/menu_app_bar.dart';
import '../widgets/menue_page/menu_grid/menu_grid.dart';
import '../widgets/menue_page/menu_search_bar.dart';
import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';
import 'package:rms_shared_package/models/menu_models/category_model/category_model.dart';
import 'food_details_page.dart';

/// [MenuePage] is the main entry point for the digital menu screen.
///
/// It serves as a container that brings together all menu-related components:
/// 1. [MenuAppBar] - Displays the header and current table.
/// 2. [MenuSearchBar] - Allows waiters to find foods by name or ID.
/// 3. [CategoryFilters] - Horizontal list for filtering items by category.
/// 4. [MenuGrid] - Display area for the filtered list of food items.
///
/// This page uses [MultiBlocProvider] to manage two distinct states:
/// - [MenuBloc]: Handles fetching and loading the raw data from Firestore.
/// - [MenuFilterCubit]: Manages local UI states like search queries and selected categories.
///
class MenuePage extends StatelessWidget {
  final String tableNumber;

  const MenuePage({super.key, required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Provides the MenuBloc and triggers the initial data fetch.
        BlocProvider(create: (context) => getIt<MenuBloc>()..add(FetchMenu())),
        // Provides the MenuFilterCubit for reactive searching and category selection.
        BlocProvider(create: (context) => getIt<MenuFilterCubit>()),
      ],
      child: Scaffold(
        backgroundColor: NeutralColors.background,
        // The custom app bar shows the table context (e.g. Table 12).
        appBar: MenuAppBar(tableNumber: tableNumber),
        body: SafeArea(
          child: BlocBuilder<MenuBloc, MenuState>(
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
                    style: const TextStyle(color: Colors.white),
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
                            builder: (context) =>
                                FoodDetailsPage(foodId: food.id!),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
