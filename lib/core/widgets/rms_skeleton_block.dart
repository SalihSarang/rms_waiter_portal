import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A reusable skeleton loader block with a subtle gradient effect, used to represent
/// loading states across the application.
class RmsSkeletonBlock extends StatelessWidget {
  final double height;
  final double? width;
  final double borderRadius;

  const RmsSkeletonBlock({
    super.key,
    required this.height,
    this.width,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // CONTAINER: Base structure for the skeleton element
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        // DECORATION: Linear gradient to create a subtle shimmer/depth effect
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
