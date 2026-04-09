import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class TableStatusData {
  final Color color;
  final String text;

  const TableStatusData({required this.color, required this.text});

  static TableStatusData getStatusData(TableModel table) {
    final availableSeats = table.seats - table.occupiedSeats;

    switch (table.status) {
      case TableStatus.available:
        return const TableStatusData(
          color: SemanticColors.success,
          text: 'FREE',
        );
      case TableStatus.occupied:
        if (availableSeats == 0) {
          return const TableStatusData(
            color: SemanticColors.error,
            text: 'FULL',
          );
        } else {
          return const TableStatusData(
            color: SemanticColors.info,
            text: 'BUSY',
          );
        }
      case TableStatus.served:
        return const TableStatusData(
          color: StatusColors.purpleLight,
          text: 'BILL',
        );
      case TableStatus.reserved:
        return const TableStatusData(
          color: SemanticColors.warning,
          text: 'RSVD',
        );
      default:
        return const TableStatusData(
          color: NeutralColors.border,
          text: 'UNKNOWN',
        );
    }
  }
}
