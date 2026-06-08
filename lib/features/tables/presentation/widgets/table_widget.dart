import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

import 'canvas_components/table_seat_badge.dart';
import 'utils/table_widget_utils.dart';

class TableWidget extends StatelessWidget {
  final TableModel table;
  final bool isPreview;
  final VoidCallback? onTap;

  const TableWidget({
    super.key,
    required this.table,
    this.isPreview = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCircle = table.shape == TableShape.circle;
    final (Color fill, Color border, Color textColor, Color badgeBg) =
        TableWidgetUtils.resolveColors(table: table, isPreview: isPreview);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: table.width,
        height: table.height,
        decoration: BoxDecoration(
          color: fill,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle ? null : BorderRadius.circular(16),
          border: Border.all(color: border, width: 1.5),
          boxShadow: isPreview
              ? []
              : [
                  BoxShadow(
                    color: NeutralColors.shadow.withValues(alpha: 0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
          gradient: isPreview
              ? null
              : TableWidgetUtils.resolveGradient(table: table),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                table.name,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: isPreview ? NeutralColors.icon : textColor,
                  letterSpacing: 0.2,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              TableSeatBadge(
                table: table,
                isPreview: isPreview,
                badgeBg: badgeBg,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
