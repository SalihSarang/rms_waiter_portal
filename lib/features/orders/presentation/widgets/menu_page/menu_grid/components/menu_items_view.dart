import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';
import 'menu_item_card.dart';
import 'package:waiter_portal/core/widgets/rms_shimmer.dart';

/// [MenuItemsView] displays a responsive grid of actual food items.
///
/// It's a pure UI component that takes a filtered list of [FoodModel]
/// and renders them using [MenuItemCard].
class MenuItemsView extends StatelessWidget {
  final List<FoodModel> foods;
  final ValueChanged<FoodModel>? onFoodTap;

  const MenuItemsView({super.key, required this.foods, this.onFoodTap});

  @override
  Widget build(BuildContext context) {
    return ShimmerScope(
      child: GridView.builder(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 180),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75, // Matches the skeleton aspect ratio
        ),
        itemCount: foods.length,
        itemBuilder: (context, index) {
          return MenuItemCard(
            food: foods[index],
            onTap: () => onFoodTap?.call(foods[index]),
          );
        },
      ),
    );
  }
}
