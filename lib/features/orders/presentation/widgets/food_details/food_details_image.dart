import 'package:flutter/material.dart';
import 'food_image_placeholder.dart';

/// [FoodDetailsImage] handles the loading and display of a food item's image.
/// It includes a modern placeholder and error handling.
class FoodDetailsImage extends StatelessWidget {
  final String? imageUrl;

  const FoodDetailsImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return const FoodImagePlaceholder();
    }

    return Image.network(
      imageUrl!,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) =>
          const FoodImagePlaceholder(),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const FoodImagePlaceholder();
      },
    );
  }
}
