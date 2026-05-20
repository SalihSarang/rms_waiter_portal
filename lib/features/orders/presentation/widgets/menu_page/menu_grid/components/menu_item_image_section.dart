import 'package:flutter/material.dart';
import 'card_image.dart';
import 'sold_out_overlay.dart';

class MenuItemImageSection extends StatelessWidget {
  final String imageUrl;
  final bool isSoldOut;

  const MenuItemImageSection({
    super.key,
    required this.imageUrl,
    required this.isSoldOut,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Stack(
        children: [
          CardImage(imageUrl: imageUrl),
          if (isSoldOut) const SoldOutOverlay(),
        ],
      ),
    );
  }
}
