import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// [CardInfo] displays the food name and its price in the menu item card.
class CardInfo extends StatelessWidget {
  final String name;
  final double price;

  const CardInfo({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: TextColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '\$$price',
            style: const TextStyle(
              color: SemanticColors.info,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
