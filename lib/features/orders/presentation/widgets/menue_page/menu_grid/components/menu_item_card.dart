import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';
import 'card_image.dart';
import 'card_info.dart';
import 'sold_out_overlay.dart';

/// [MenuItemCard] is the visual representation of a single food item.
/// It uses several sub-widgets for better modularity and readability.
class MenuItemCard extends StatelessWidget {
  final FoodModel food;
  final VoidCallback? onTap;

  const MenuItemCard({super.key, required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    // For now, we take the price from the first portion if available.
    final price = food.portions.isNotEmpty ? food.portions.first.price : 0.0;
    final isSoldOut = !food.isAvailable;

    return Container(
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE SECTION
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    CardImage(imageUrl: food.imageUrl),
                    if (isSoldOut) const SoldOutOverlay(),
                  ],
                ),
              ),
              // INFO SECTION
              Expanded(
                flex: 2,
                child: CardInfo(name: food.name, price: price),
              ),
            ],
          ),
          // INTERACTION LAYER: Transparent material for the inkwell ripple effect.
          Positioned.fill(
            child: Material(
              color: NeutralColors.transparent,
              child: InkWell(
                onTap: isSoldOut ? null : onTap,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
