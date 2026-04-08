import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';

class OrderItemPlaceholderImage extends StatelessWidget {
  const OrderItemPlaceholderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      color: NeutralColors.card,
      child: const Icon(
        Icons.broken_image,
        color: NeutralColors.icon,
        size: 20,
      ),
    );
  }
}
