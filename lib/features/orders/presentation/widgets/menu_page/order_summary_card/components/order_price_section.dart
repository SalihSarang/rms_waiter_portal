import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Builds the price and table number section.
class OrderPriceSection extends StatelessWidget {
  final double total;
  final String tableNumber;

  const OrderPriceSection({
    super.key,
    required this.total,
    required this.tableNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '\$${total.toStringAsFixed(2)}',
          style: const TextStyle(
            color: TextColors.primary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Table $tableNumber',
          style: const TextStyle(color: NeutralColors.icon, fontSize: 11),
        ),
      ],
    );
  }
}
