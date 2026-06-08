import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'canvas_grid_background.dart';
import 'canvas_table_item.dart';

class CanvasContent extends StatelessWidget {
  final List<TableModel> tables;
  final ValueChanged<TableModel>? onTableTap;

  const CanvasContent({super.key, required this.tables, this.onTableTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Grid Background (inside IV so it pans with content)
        const Positioned.fill(child: CanvasGridBackground()),
        // Tables
        if (tables.isNotEmpty)
          ...tables.map(
            (table) => CanvasTableItem(
              table: table,
              onTap: () => onTableTap?.call(table),
            ),
          ),
      ],
    );
  }
}
