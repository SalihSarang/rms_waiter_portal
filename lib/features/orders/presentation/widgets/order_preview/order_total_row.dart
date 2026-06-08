import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'order_summary_components.dart';

/// [OrderTotalRow] displays the subtotal, tax, and the calculated total amount.
class OrderTotalRow extends StatelessWidget {
  final double total;

  const OrderTotalRow({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    final subtotal = total;
    final finalTotal = subtotal;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: NeutralColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: NeutralColors.border),
      ),
      child: Column(
        children: [
          SummaryRow(
            label: 'Subtotal',
            value: '\$${subtotal.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 12),

          const SummaryDivider(),
          TotalRow(
            label: 'Total Amount',
            value: '\$${finalTotal.toStringAsFixed(2)}',
          ),
        ],
      ),
    );
  }
}
