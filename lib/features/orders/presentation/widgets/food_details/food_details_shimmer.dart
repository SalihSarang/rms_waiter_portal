import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

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
          _ShimmerBlock(height: 240, width: double.infinity, borderRadius: 20),
          const SizedBox(height: 24),
          // Title Shimmer
          _ShimmerBlock(height: 32, width: 200, borderRadius: 8),
          const SizedBox(height: 8),
          // Description Shimmer
          _ShimmerBlock(height: 16, width: double.infinity, borderRadius: 4),
          const SizedBox(height: 8),
          _ShimmerBlock(height: 16, width: double.infinity, borderRadius: 4),
          const SizedBox(height: 24),
          // Portion Title Shimmer
          _ShimmerBlock(height: 20, width: 120, borderRadius: 4),
          const SizedBox(height: 12),
          // Portion Items Shimmer
          _ShimmerBlock(height: 60, width: double.infinity, borderRadius: 16),
          const SizedBox(height: 12),
          _ShimmerBlock(height: 60, width: double.infinity, borderRadius: 16),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _ShimmerBlock extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;

  const _ShimmerBlock({
    required this.height,
    required this.width,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              NeutralColors.surface,
              NeutralColors.border.withValues(alpha: 0.3),
              NeutralColors.surface,
            ],
          ),
        ),
      ),
    );
  }
}
