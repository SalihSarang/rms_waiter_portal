import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class TableSeatBadge extends StatelessWidget {
  final TableModel table;
  final bool isPreview;
  final Color? badgeBg;

  const TableSeatBadge({
    super.key,
    required this.table,
    this.isPreview = false,
    this.badgeBg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: isPreview
            ? NeutralColors.border.withValues(alpha: 0.5)
            : badgeBg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.chair_rounded, size: 9, color: NeutralColors.icon),
          const SizedBox(width: 3),
          Text(
            '${table.seats}',
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: NeutralColors.icon,
            ),
          ),
        ],
      ),
    );
  }
}
