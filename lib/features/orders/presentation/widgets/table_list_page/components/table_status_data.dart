import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class TableStatusData {
  final Color color;
  final String text;

  const TableStatusData({required this.color, required this.text});

  static TableStatusData getStatusData(TableModel table) {
    // Special statuses take priority
    if (table.status == TableStatus.served) {
      return const TableStatusData(
        color: StatusColors.purpleLight,
        text: 'BILL',
      );
    }

    if (table.status == TableStatus.reserved) {
      return const TableStatusData(color: SemanticColors.warning, text: 'RSVD');
    }

    // Determine status based on occupancy
    if (table.occupiedSeats >= table.seats && table.seats > 0) {
      return const TableStatusData(color: SemanticColors.error, text: 'FULL');
    } else if (table.occupiedSeats > 0 && table.seats > 0) {
      final occupancyRatio = table.occupiedSeats / table.seats;

      if (occupancyRatio > 0.5) {
        return const TableStatusData(color: StatusColors.pending, text: 'BUSY');
      }

      return const TableStatusData(color: SemanticColors.warning, text: 'BUSY');
    }

    return const TableStatusData(color: SemanticColors.success, text: 'FREE');
  }
}
