import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../table_widget.dart';

class CanvasTableItem extends StatelessWidget {
  final TableModel table;
  final VoidCallback? onTap;

  const CanvasTableItem({super.key, required this.table, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: ValueKey(table.id),
      left: table.x,
      top: table.y,
      child: RepaintBoundary(
        child: TableWidget(table: table, onTap: onTap),
      ),
    );
  }
}
