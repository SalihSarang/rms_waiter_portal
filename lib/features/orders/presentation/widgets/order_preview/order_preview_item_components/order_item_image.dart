import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:waiter_portal/core/widgets/rms_shimmer.dart';
import 'package:waiter_portal/features/orders/presentation/widgets/order_preview/order_preview_item_components/order_item_plaseholder_image.dart';

class OrderItemImage extends StatelessWidget {
  final String imageUrl;

  const OrderItemImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: NeutralColors.border, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: imageUrl.isNotEmpty
            ? Image.network(
                imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const PulseContainer(
                    width: 60,
                    height: 60,
                    borderRadius: BorderRadius.zero,
                  );
                },
                errorBuilder: (context, error, stackTrace) =>
                    const OrderItemPlaceholderImage(),
              )
            : const OrderItemPlaceholderImage(),
      ),
    );
  }
}
