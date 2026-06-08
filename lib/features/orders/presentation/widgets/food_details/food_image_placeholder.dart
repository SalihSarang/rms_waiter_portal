import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// [FoodImagePlaceholder] provides a standardized placeholder for food images
/// while they are loading or if an error occurrs.
class FoodImagePlaceholder extends StatelessWidget {
  const FoodImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: NeutralColors.surface,
      child: const Center(
        child: HugeIcon(
          icon: HugeIcons.strokeRoundedImage01,
          color: NeutralColors.icon,
          size: 48,
        ),
      ),
    );
  }
}
