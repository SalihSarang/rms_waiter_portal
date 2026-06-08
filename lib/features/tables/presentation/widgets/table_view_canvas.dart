import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../bloc/table_view_bloc.dart';
import '../bloc/table_view_state.dart';
import 'canvas_components/canvas_interactive_viewer.dart';

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
            child: CanvasInteractiveViewer(
              tables: state.tables,
              onTableTap: onTableTap,
            ),
          ),
        );
      },
    );
  }
}
