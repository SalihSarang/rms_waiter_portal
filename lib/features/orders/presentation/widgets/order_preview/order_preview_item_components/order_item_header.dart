import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class OrderItemHeader extends StatelessWidget {
  final String name;
  final double price;

  const OrderItemHeader({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              color: TextColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: const TextStyle(
            color: TextColors.primary,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
