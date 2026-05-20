import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../bloc/table_search/table_search_cubit.dart';
import '../../bloc/table_search/table_search_state.dart';
import '../../utils/table_utils.dart';
import 'table_grid.dart';

class TableListSearchContent extends StatelessWidget {
  final List<TableModel> tables;

  const TableListSearchContent({super.key, required this.tables});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableSearchCubit, TableSearchState>(
      builder: (context, searchState) {
        final query = searchState.searchQuery;
        final filteredTables = TableUtils.filterTables(tables, query);

        if (filteredTables.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: Center(
              child: Text(
                query.isNotEmpty
                    ? 'No tables matching "$query"'
                    : 'No tables available in this hall',
                textAlign: TextAlign.center,
                style: const TextStyle(color: NeutralColors.icon),
              ),
            ),
          );
        }

        return TableGrid(tables: filteredTables);
      },
    );
  }
}
