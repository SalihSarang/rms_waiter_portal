import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../bloc/table_view_bloc.dart';
import '../bloc/table_view_state.dart';
import '../painters/dot_grid_painter.dart';
import 'table_widget.dart';

class TableViewCanvas extends StatelessWidget {
  final ValueChanged<TableModel>? onTableTap;

  const TableViewCanvas({super.key, this.onTableTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableViewBloc, TableViewState>(
      builder: (context, state) {
        return ClipRect(
          child: Container(
            color: NeutralColors.background,
            child: InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(200),
              minScale: 0.4,
              maxScale: 5.0,
              constrained: false, // Allow unbounded panning
              child: SizedBox(
                // Canvas: realistic restaurant hall (~16m × 12m at 1px=1cm)
                width: 1600,
                height: 1200,
                child: Stack(
                  children: [
                    // Grid Background (inside IV so it pans with content)
                    const Positioned.fill(
                      child: RepaintBoundary(
                        child: CustomPaint(
                          painter: DotGridPainter(color: NeutralColors.border),
                        ),
                      ),
                    ),
                    // Tables
                    if (state.tables.isNotEmpty)
                      ...state.tables.map(
                        (table) => Positioned(
                          key: ValueKey(table.id),
                          left: table.x,
                          top: table.y,
                          child: RepaintBoundary(
                            child: TableWidget(
                              table: table,
                              onTap: () => onTableTap?.call(table),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
