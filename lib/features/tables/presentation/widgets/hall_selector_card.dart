import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class HallSelectorCard extends StatelessWidget {
  final HallModel hall;
  final VoidCallback onTap;

  const HallSelectorCard({
    super.key,
    required this.hall,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: NeutralColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: NeutralColors.border),
          boxShadow: [
            BoxShadow(
              color: NeutralColors.shadow.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // Ensure it doesn't force expanding
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: PrimaryColors.defaultColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.table_restaurant_rounded,
                    color: PrimaryColors.defaultColor,
                    size: 20, // slightly smaller icon
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: NeutralColors.icon,
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 8), // Replaced spacer with tiny fixed box
            Text(
              hall.name,
              style: const TextStyle(
                fontSize: 15, // slightly smaller font
                fontWeight: FontWeight.w700,
                color: NeutralColors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            const Text(
              'Tap to view layout',
              style: TextStyle(
                fontSize: 11,
                color: NeutralColors.icon,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),

      ),
    );
  }
}
