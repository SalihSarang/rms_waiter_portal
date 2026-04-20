import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/core/widgets/rms_shimmer.dart';

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
          Expanded(
            flex: 3,
            child: PulseContainer(
              color: TextColors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          // Mock Text Area
          Expanded(
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
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  PulseContainer(
                    height: 16,
                    width: 60,
                    color: TextColors.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
