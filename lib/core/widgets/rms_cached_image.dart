import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../services/rms_image_cache_manager.dart';
import 'rms_shimmer.dart';

/// Unified cached image widget for the Waiter mobile application.
///
/// Provides:
/// 1. Automatic persistent disk caching via [RmsImageCacheManager].
/// 2. In-memory decoded bitmap downsampling via [memCacheWidth] and [memCacheHeight]
///    to prevent Out-Of-Memory errors on low-spec handheld devices.
/// 3. Synchronized shimmer pulse placeholder during loading.
/// 4. Graceful error handling for missing, invalid, or offline images.
class RmsCachedImage extends StatelessWidget {
  /// The remote URL of the image to display.
  final String? imageUrl;

  /// Optional explicit display width.
  final double? width;

  /// Optional explicit display height.
  final double? height;

  /// How the image should be inscribed into the box. Defaults to [BoxFit.cover].
  final BoxFit fit;

  /// Optional border radius for rounded clipping.
  final BorderRadius? borderRadius;

  /// Target width for in-memory bitmap decoding.
  ///
  /// Downsampling large source images prevents memory bloat during grid scrolling.
  final int? memCacheWidth;

  /// Target height for in-memory bitmap decoding.
  final int? memCacheHeight;

  /// Custom placeholder widget shown while image is loading.
  /// Defaults to [PulseContainer] shimmer if not provided.
  final Widget? placeholder;

  /// Custom widget shown when the URL is invalid or download fails.
  final Widget? errorWidget;

  const RmsCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.memCacheWidth,
    this.memCacheHeight,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    // Fast-path validation: If URL is null, empty, or lacks an HTTP scheme,
    // render the error or placeholder fallback without querying cache or network.
    final validUrl = imageUrl?.trim();
    final hasValidScheme = validUrl != null &&
        validUrl.isNotEmpty &&
        (validUrl.startsWith('http://') || validUrl.startsWith('https://'));

    if (!hasValidScheme) {
      return _buildContainer(
        child: errorWidget ?? _buildDefaultError(),
      );
    }

    final optimizedUrl = optimizeUrl(validUrl, targetWidth: memCacheWidth ?? 400);

    // Build the cached network image connected to the isolated cache manager.
    final imageWidget = CachedNetworkImage(
      imageUrl: optimizedUrl,
      width: width,
      height: height,
      fit: fit,
      cacheManager: RmsImageCacheManager.instance,
      memCacheWidth: memCacheWidth,
      memCacheHeight: memCacheHeight,
      fadeInDuration: const Duration(milliseconds: 200),
      placeholder: (context, url) =>
          placeholder ??
          PulseContainer(
            width: width,
            height: height,
            borderRadius: borderRadius ?? BorderRadius.zero,
          ),
      errorWidget: (context, url, error) =>
          errorWidget ?? _buildDefaultError(),
    );

    return _buildContainer(child: imageWidget);
  }

  /// Optimizes remote image URLs (Cloudinary and Unsplash) to download lightweight,
  /// bandwidth-efficient thumbnails instead of raw multi-megabyte camera files.
  static String optimizeUrl(String url, {int targetWidth = 400}) {
    final trimmed = url.trim();
    if (trimmed.isEmpty) return trimmed;

    // Cloudinary transformation injection:
    // Insert f_auto,q_auto:eco,w_<width>,c_limit right after /upload/
    if (trimmed.contains('cloudinary.com') && trimmed.contains('/upload/')) {
      final uploadPattern = RegExp(r'/upload/(?!f_auto|q_auto|w_)');
      if (uploadPattern.hasMatch(trimmed)) {
        return trimmed.replaceFirst(
          '/upload/',
          '/upload/f_auto,q_auto:eco,w_$targetWidth,c_limit/',
        );
      }
    }

    // Unsplash query optimization:
    if (trimmed.contains('images.unsplash.com')) {
      final uri = Uri.tryParse(trimmed);
      if (uri != null) {
        final queryParams = Map<String, String>.from(uri.queryParameters);
        queryParams['w'] = targetWidth.toString();
        queryParams['auto'] = 'format';
        queryParams['fit'] = 'crop';
        queryParams['q'] = '60';
        return uri.replace(queryParameters: queryParams).toString();
      }
    }

    return trimmed;
  }

  /// Wraps the child in a ClipRRect when a border radius is specified.
  Widget _buildContainer({required Widget child}) {
    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: SizedBox(
          width: width,
          height: height,
          child: child,
        ),
      );
    }
    return SizedBox(
      width: width,
      height: height,
      child: child,
    );
  }

  /// Default fallback error representation when no custom error widget is supplied.
  Widget _buildDefaultError() {
    return Container(
      color: const Color(0xFF262626),
      alignment: Alignment.center,
      child: const Icon(
        Icons.broken_image_outlined,
        color: Color(0xFF737373),
        size: 24,
      ),
    );
  }
}

