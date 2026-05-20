import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';
import 'menu_item_image_section.dart';
import 'menu_item_info_section.dart';
import 'card_interaction_layer.dart';

class MenuItemCardBody extends StatelessWidget {
  final FoodModel food;
  final double price;
  final bool isSoldOut;
  final VoidCallback? onTap;

  const MenuItemCardBody({
    super.key,
    required this.food,
    required this.price,
    required this.isSoldOut,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MenuItemImageSection(imageUrl: food.imageUrl, isSoldOut: isSoldOut),
            MenuItemInfoSection(name: food.name, price: price),
          ],
        ),
        CardInteractionLayer(isSoldOut: isSoldOut, onTap: onTap),
      ],
    );
  }
}
