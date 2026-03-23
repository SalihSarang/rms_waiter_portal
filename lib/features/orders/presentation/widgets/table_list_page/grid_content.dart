import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

import '../../../../tables/presentation/bloc/table_view_state.dart';
import 'table_card.dart';

class GridContent extends StatelessWidget {
  final TableViewState state;
  final ValueChanged<TableModel>? onTableTap;

  const GridContent({super.key, required this.state, this.onTableTap});

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return Center(
        child: Text(
          state.error!,
          style: const TextStyle(color: SemanticColors.error),
        ),
      );
    }

    if (state.tables.isEmpty) {
      return const Center(
        child: Text(
          'No tables available in this hall',
          style: TextStyle(color: NeutralColors.icon),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      itemCount: state.tables.length,
      itemBuilder: (context, index) {
        final table = state.tables[index];
        return TableCard(
          table: table,
          onTap: () => onTableTap?.call(table),
        );
      },
    );
  }
}
