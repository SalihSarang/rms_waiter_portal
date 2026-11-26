import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/config/demo_config.dart';
import 'package:rms_shared_package/services/demo_session_manager.dart';
import 'package:waiter_portal/core/services/rms_image_cache_manager.dart';
import 'package:waiter_portal/core/widgets/rms_cached_image.dart';

/// Displays the staff member avatar with offline caching support, name initials fallback,
/// and an active shift indicator.
class ProfileAvatar extends StatelessWidget {
  /// The remote URL for the staff member profile photo.
  final String? imageUrl;

  /// Staff member name, used to display initials when no photo is uploaded.
  final String? name;

  /// Whether the staff member is currently on an active shift.
  final bool isActive;

  /// Circle radius for the avatar. Defaults to 40.
  final double radius;

  const ProfileAvatar({
    super.key,
    this.imageUrl,
    this.name,
    this.isActive = true,
    this.radius = 40,
  });

  @override
  Widget build(BuildContext context) {
    // Validate remote URL before attaching CachedNetworkImageProvider.
    // In demo mode, if avatar is omitted, provide the realistic demo avatar.
    final rawUrl = (imageUrl != null && imageUrl!.trim().isNotEmpty)
        ? imageUrl!.trim()
        : (DemoSessionManager.isDemoMode ? DemoConfig.defaultWaiterAvatar : '');

    final hasValidScheme =
        rawUrl.isNotEmpty &&
        (rawUrl.startsWith('http://') || rawUrl.startsWith('https://'));

    // Optimize remote CDN image URL for bandwidth efficiency.
    final optimizedUrl = hasValidScheme
        ? RmsCachedImage.optimizeUrl(rawUrl, targetWidth: (radius * 2).toInt())
        : '';

    final initialLetter = (name != null && name!.trim().isNotEmpty)
        ? name!.trim().substring(0, 1).toUpperCase()
        : null;

    final fontSize = (radius * 0.65).clamp(11.0, 32.0);
    final iconSize = (radius * 0.95).clamp(16.0, 48.0);
    final badgeSize = (radius * 0.4).clamp(9.0, 18.0);
    final borderWidth = radius > 25 ? 3.0 : 1.5;

    return Stack(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: hasValidScheme
              ? NeutralColors.border
              : PrimaryColors.defaultColor.withValues(alpha: 0.15),
          backgroundImage: hasValidScheme
              ? CachedNetworkImageProvider(
                  optimizedUrl,
                  cacheManager: RmsImageCacheManager.instance,
                )
              : null,
          onBackgroundImageError: hasValidScheme ? (_, _) {} : null,
          child: !hasValidScheme
              ? (initialLetter != null
                    ? Text(
                        initialLetter,
                        style: TextStyle(
                          color: PrimaryColors.defaultColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Icon(
                        Icons.person,
                        size: iconSize,
                        color: NeutralColors.icon,
                      ))
              : null,
        ),
        // Active shift badge indicator.
        if (isActive)
          Positioned(
            bottom: 1,
            right: 1,
            child: Container(
              height: badgeSize,
              width: badgeSize,
              decoration: BoxDecoration(
                color: StatusColors.ready,
                shape: BoxShape.circle,
                border: Border.all(
                  color: NeutralColors.background,
                  width: borderWidth,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
