import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

import 'components/table_card_title.dart';
import 'components/table_seat_info.dart';
import 'components/table_status_badge.dart';
import 'components/table_status_data.dart';

class TableCard extends StatelessWidget {
  final TableModel table;
  final VoidCallback? onTap;

  const TableCard({super.key, required this.table, this.onTap});

  @override
  Widget build(BuildContext context) {
    final statusData = TableStatusData.getStatusData(table);

    return Material(
      color: NeutralColors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: statusData.color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: statusData.color.withValues(alpha: 0.5),
              width: 1.2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TableCardTitle(name: table.name),
                  TableStatusBadge(
                    text: statusData.text,
                    color: statusData.color,
                  ),
                ],
              ),
              TableSeatInfo(
                availableSeats: table.seats - table.occupiedSeats,
                totalSeats: table.seats,
                isOccupied: table.occupiedSeats > 0,
                statusColor: statusData.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
