import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/core/widgets/rms_shimmer.dart';

/// [CardImage] handles the network image with loading and error states for menu item cards.
class CardImage extends StatelessWidget {
  final String imageUrl;

  const CardImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return PulseContainer(
            color: TextColors.primary.withValues(alpha: 0.12),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => const Center(
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedImage01,
            color: NeutralColors.icon,
            size: 32,
          ),
        ),
      ),
    );
  }
}
