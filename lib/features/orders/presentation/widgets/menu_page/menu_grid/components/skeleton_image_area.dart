import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/core/widgets/rms_shimmer.dart';

class SkeletonImageArea extends StatelessWidget {
  const SkeletonImageArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: PulseContainer(
        color: TextColors.primary.withValues(alpha: 0.12),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
    );
  }
}
