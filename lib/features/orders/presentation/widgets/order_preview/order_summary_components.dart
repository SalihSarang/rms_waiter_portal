import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

export 'tax_badge.dart';
export 'summary_divider.dart';
export 'total_row.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final Widget? trailingLabel;

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.trailingLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(color: NeutralColors.icon, fontSize: 12),
            ),
            if (trailingLabel != null) ...[
              const SizedBox(width: 4),
              trailingLabel!,
            ],
          ],
        ),
        Text(
          value,
          style: const TextStyle(
            color: TextColors.primary,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
