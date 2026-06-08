import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';
import 'menu_item_card_body.dart';

/// [MenuItemCard] is the visual representation of a single food item.
/// It uses several sub-widgets for better modularity and readability.
class MenuItemCard extends StatelessWidget {
  final FoodModel food;
  final VoidCallback? onTap;

  const MenuItemCard({super.key, required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    final price = food.portions.isNotEmpty ? food.portions.first.price : 0.0;
    final isSoldOut = !food.isAvailable;

    return Container(
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: MenuItemCardBody(
        food: food,
        price: price,
        isSoldOut: isSoldOut,
        onTap: onTap,
      ),
    );
  }
}
