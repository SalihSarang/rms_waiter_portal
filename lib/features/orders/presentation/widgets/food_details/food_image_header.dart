import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'food_details_image.dart';

/// [FoodImageHeader] provides a stylized container for food item images.
/// It wraps the core image loading logic in a consistent container
/// with rounded corners and a gradient overlay for better text readability.
class FoodImageHeader extends StatelessWidget {
  final String? imageUrl;

  const FoodImageHeader({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FoodDetailsImage(imageUrl: imageUrl),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    NeutralColors.shadow.withValues(alpha: 0.6),
                    NeutralColors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
