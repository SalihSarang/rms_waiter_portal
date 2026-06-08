import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'canvas_content.dart';

class CanvasInteractiveViewer extends StatelessWidget {
  final List<TableModel> tables;
  final ValueChanged<TableModel>? onTableTap;

  const CanvasInteractiveViewer({
    super.key,
    required this.tables,
    this.onTableTap,
  });

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      boundaryMargin: const EdgeInsets.all(200),
      minScale: 0.4,
      maxScale: 5.0,
      constrained: false,
      child: SizedBox(
        width: 1600,
        height: 1200,
        child: CanvasContent(tables: tables, onTableTap: onTableTap),
      ),
    );
  }
}
