import 'package:flutter/material.dart';
import 'package:waiter_portal/core/widgets/rms_skeleton_block.dart';

class FoodDetailsShimmer extends StatelessWidget {
  const FoodDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          // Image Shimmer
          const RmsSkeletonBlock(
            height: 240,
            width: double.infinity,
            borderRadius: 20,
          ),
          const SizedBox(height: 24),
          // Title Shimmer
          const RmsSkeletonBlock(height: 32, width: 200, borderRadius: 8),
          const SizedBox(height: 8),
          // Description Shimmer
          const RmsSkeletonBlock(
            height: 16,
            width: double.infinity,
            borderRadius: 4,
          ),
          const SizedBox(height: 8),
          const RmsSkeletonBlock(
            height: 16,
            width: double.infinity,
            borderRadius: 4,
          ),
          const SizedBox(height: 24),
          // Portion Title Shimmer
          const RmsSkeletonBlock(height: 20, width: 120, borderRadius: 4),
          const SizedBox(height: 12),
          // Portion Items Shimmer
          const RmsSkeletonBlock(
            height: 60,
            width: double.infinity,
            borderRadius: 16,
          ),
          const SizedBox(height: 12),
          const RmsSkeletonBlock(
            height: 60,
            width: double.infinity,
            borderRadius: 16,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
