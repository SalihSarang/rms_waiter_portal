import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

/// The internal layout of the table seat badge, displaying the chair icon and seat count.
class TableSeatBadgeContent extends StatelessWidget {
  final TableModel table;

  const TableSeatBadgeContent({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
