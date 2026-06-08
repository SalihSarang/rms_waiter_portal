import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/core/widgets/rms_shimmer.dart';

class SkeletonInfoArea extends StatelessWidget {
  const SkeletonInfoArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PulseContainer(
              height: 12,
              width: double.infinity,
              color: TextColors.primary.withValues(alpha: 0.12),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            PulseContainer(
              height: 16,
              width: 60,
              color: TextColors.primary.withValues(alpha: 0.12),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
          ],
        ),
      ),
    );
  }
}
