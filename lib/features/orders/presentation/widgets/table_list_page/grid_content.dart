import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

import '../../../../tables/presentation/bloc/table_view_state.dart';
import 'table_card.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/table_search/table_search_cubit.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/table_search/table_search_state.dart';

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

    return BlocBuilder<TableSearchCubit, TableSearchState>(
      builder: (context, searchState) {
        var filteredTables = state.tables;
        if (searchState.searchQuery.isNotEmpty) {
          final query = searchState.searchQuery.toLowerCase();
          filteredTables = filteredTables.where((table) {
            return table.name.toLowerCase().contains(query);
          }).toList();
        }

        if (filteredTables.isEmpty) {
          return Center(
            child: Text(
              searchState.searchQuery.isNotEmpty
                  ? 'No tables matching "${searchState.searchQuery}"'
                  : 'No tables available in this hall',
              style: const TextStyle(color: NeutralColors.icon),
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
          itemCount: filteredTables.length,
          itemBuilder: (context, index) {
            final table = filteredTables[index];
            return TableCard(
              table: table,
              onTap: () => onTableTap?.call(table),
            );
          },
        );
      },
    );
  }
}
