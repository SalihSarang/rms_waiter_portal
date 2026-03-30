import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';

import 'menu_skeleton.dart';

/// [MenuItemCard] is the visual representation of a single food item.
///
/// It handles:
/// 1. **Image Display**: Loads images from a URL with a progress loader and error fallback.
/// 2. **Availability Check**: Shows a semi-transparent "Sold Out" overlay if [isAvailable] is false.
/// 3. **Dynamic Pricing**: Extracts the first portion price for display.
/// 4. **User Interaction**: Triggers an inkwell ripple effect on tap (disabled if sold out).
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
              // IMAGE SECTION: Uses Image.network with robust error/loading handling.
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        food.imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          // Standardized image skeleton using design system tokens.
                          return PulseContainer(
                            color: NeutralColors.white.withValues(alpha: 0.12),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                              child: Icon(
                                Icons.broken_image,
                                color: NeutralColors.icon,
                              ),
                            ),
                      ),
                    ),
                    // SOLD OUT OVERLAY: Consistent shading using NeutralColors.
                    if (isSoldOut)
                      Positioned.fill(
                        child: Container(
                          color: NeutralColors.shadow.withValues(alpha: 0.4),
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: SemanticColors.error.withValues(
                                  alpha: 0.9,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Sold Out',
                                style: TextStyle(
                                  color: NeutralColors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              // INFO SECTION: Uses NeutralColors for text.
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        food.name,
                        style: const TextStyle(
                          color: NeutralColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '\$$price',
                        style: const TextStyle(
                          color: SemanticColors.info,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Standardized transparent material layer.
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
