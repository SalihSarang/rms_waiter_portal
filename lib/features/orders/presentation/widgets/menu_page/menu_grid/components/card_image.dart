import 'package:material_ui/material_ui.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/config/demo_config.dart';
import 'package:waiter_portal/core/widgets/rms_cached_image.dart';

/// CardImage renders a menu item's image using multi-tier caching.
///
/// Images are persistently cached to disk to allow offline table service,
/// and downsampled in memory to 400x300 pixels to prevent Out-Of-Memory
/// crashes during rapid grid scrolling on handheld devices.
class CardImage extends StatelessWidget {
  /// The remote URL for the menu item's photography.
  final String imageUrl;

  /// Optional name of the food item, used for photo fallback.
  final String? foodName;

  const CardImage({super.key, required this.imageUrl, this.foodName});

  @override
  Widget build(BuildContext context) {
    // If the custom uploaded imageUrl is missing, provide a high-quality dish photo fallback
    // based on the dish name so waitstaff always have visual cues.
    final displayUrl = imageUrl.trim().isNotEmpty
        ? imageUrl.trim()
        : DemoConfig.getDemoFoodImageUrl(foodName ?? '');

    return Positioned.fill(
      child: RmsCachedImage(
        imageUrl: displayUrl,
        fit: BoxFit.cover,
        // Downsample the decoded bitmap in memory.
        // Menu grid cards display at roughly 200x150 dp; decoding at 400x300 px
        // provides retina clarity while saving ~75% memory compared to source photos.
        memCacheWidth: 400,
        memCacheHeight: 300,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        errorWidget: const Center(
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedImage01,
            color: NeutralColors.icon,
            size: 32,
          ),
        ),
      ),
    );
  }
}
