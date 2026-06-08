import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'skeleton_image_area.dart';
import 'skeleton_info_area.dart';

/// [MenuSkeleton] is a placeholder widget shown while menu items are loading.
///
/// It mimics the shape and layout of [MenuItemCard] using [PulseContainer]s.
class MenuSkeleton extends StatelessWidget {
  const MenuSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mock Image Area
          const SkeletonImageArea(),
          // Mock Text Area
          const SkeletonInfoArea(),
        ],
      ),
    );
  }
}
