import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';
import '../../bloc/menu_filter/menu_filter_cubit.dart';
import '../../bloc/menu_filter/menu_filter_state.dart';
import '../../utils/menu_utils.dart';
import '../menu_page/menu_grid/components/menu_items_view.dart';
import '../../pages/food_details_page.dart';

class MenuGridSection extends StatelessWidget {
  final List<FoodModel> foods;

  const MenuGridSection({super.key, required this.foods});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuFilterCubit, MenuFilterState>(
      builder: (context, filterState) {
        final filteredFoods = MenuUtils.filterFoods(foods, filterState);

        return MenuItemsView(
          foods: filteredFoods,
          onFoodTap: (food) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (innerContext) => FoodDetailsPage(foodId: food.id!),
              ),
            );
          },
        );
      },
    );
  }
}
