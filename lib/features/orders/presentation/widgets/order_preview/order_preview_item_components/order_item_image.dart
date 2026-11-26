import 'package:material_ui/material_ui.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_shared_package/config/demo_config.dart';
import 'package:waiter_portal/core/widgets/rms_cached_image.dart';
import 'order_item_plaseholder_image.dart';

/// OrderItemImage displays a compact thumbnail for an item in the order preview cart.
///
/// Downsamples the cached image to 120x120 pixels in memory to maintain
/// low RAM consumption when review lists contain numerous items.
class OrderItemImage extends StatelessWidget {
  /// The remote URL of the ordered menu item.
  final String imageUrl;

  /// Optional name of the food item, used for photo fallback.
  final String? foodName;

  const OrderItemImage({super.key, required this.imageUrl, this.foodName});

  @override
  Widget build(BuildContext context) {
    final displayUrl = imageUrl.trim().isNotEmpty
        ? imageUrl.trim()
        : DemoConfig.getDemoFoodImageUrl(foodName ?? '');

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: NeutralColors.border, width: 1),
      ),
      child: RmsCachedImage(
        imageUrl: displayUrl,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        // Thumbnail downsampling: decodes at 120x120 px for 2x retina displays.
        memCacheWidth: 120,
        memCacheHeight: 120,
        borderRadius: BorderRadius.circular(7),
        errorWidget: const OrderItemPlaceholderImage(),
      ),
    );
  }
}
