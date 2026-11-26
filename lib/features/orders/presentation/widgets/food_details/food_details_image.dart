import 'package:material_ui/material_ui.dart';
import 'package:rms_shared_package/config/demo_config.dart';
import 'package:waiter_portal/core/widgets/rms_cached_image.dart';
import 'food_image_placeholder.dart';

/// FoodDetailsImage renders the detailed hero image for a selected food item.
///
/// Leverages the multi-tier image cache so dishes already seen in the menu grid
/// display immediately with zero network latency.
class FoodDetailsImage extends StatelessWidget {
  /// The remote URL of the selected food item.
  final String? imageUrl;

  /// Optional name of the food item, used for photo fallback.
  final String? foodName;

  const FoodDetailsImage({super.key, required this.imageUrl, this.foodName});

  @override
  Widget build(BuildContext context) {
    final displayUrl = (imageUrl != null && imageUrl!.trim().isNotEmpty)
        ? imageUrl!.trim()
        : DemoConfig.getDemoFoodImageUrl(foodName ?? '');

    return RmsCachedImage(
      imageUrl: displayUrl,
      fit: BoxFit.cover,
      placeholder: const FoodImagePlaceholder(),
      errorWidget: const FoodImagePlaceholder(),
    );
  }
}
