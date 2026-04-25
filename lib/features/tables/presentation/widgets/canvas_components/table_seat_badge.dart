import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:waiter_portal/core/utils/app_decorations.dart';
import 'components/table_seat_badge_content.dart';

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
      decoration: AppDecorations.seatBadgeDecoration(
        isPreview: isPreview,
        badgeBg: badgeBg,
      ),
      child: TableSeatBadgeContent(table: table),
    );
  }
}
