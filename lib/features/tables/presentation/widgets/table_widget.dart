import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

import 'utils/table_widget_utils.dart';

class TableWidget extends StatelessWidget {
  final TableModel table;
  final bool isPreview;

  const TableWidget({
    super.key,
    required this.table,
    this.isPreview = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCircle = table.shape == TableShape.circle;
    final (Color fill, Color border, Color textColor, Color badgeBg) =
        TableWidgetUtils.resolveColors(
      table: table,
      isPreview: isPreview,
    );

    return Container(
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
            Container(
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
                  Icon(
                    Icons.chair_rounded,
                    size: 9,
                    color: NeutralColors.icon,
                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
