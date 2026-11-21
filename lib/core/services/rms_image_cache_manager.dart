import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// Dedicated cache manager for the Waiter mobile application.
///
/// Manages persistent disk storage for menu item photos, food details,
/// cart thumbnails, and staff avatars. Configured with an isolated cache key
/// to avoid conflicts with other portals and applications.
class RmsImageCacheManager {
  // Private constructor to enforce singleton access pattern.
  RmsImageCacheManager._();

  // Key identifying the disk storage directory on the device.
  static const String _cacheKey = 'rms_waiter_image_cache';

  // Maximum age before cached images are considered stale and eligible for eviction.
  static const Duration _maxAge = Duration(days: 30);

  // Maximum number of cached image files retained on disk simultaneously.
  static const int _maxObjects = 300;

  /// Singleton instance configured with optimal storage parameters for mobile handheld devices.
  static final CacheManager instance = CacheManager(
    Config(
      _cacheKey,
      stalePeriod: _maxAge,
      maxNrOfCacheObjects: _maxObjects,
      repo: JsonCacheInfoRepository(databaseName: _cacheKey),
      fileService: HttpFileService(),
    ),
  );

  /// Clears all stored images from persistent device storage and resets the cache database.
  ///
  /// Call this method when the waitstaff needs to force refresh menu photos or free storage space.
  static Future<void> clearCache() async {
    await instance.emptyCache();
  }

  /// Evicts a single image from cache by its remote URL.
  ///
  /// Useful when a specific food item's photo is updated by the manager.
  static Future<void> evictUrl(String url) async {
    await instance.removeFile(url);
  }
}

