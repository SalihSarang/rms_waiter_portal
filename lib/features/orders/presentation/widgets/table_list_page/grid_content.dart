import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/table_search/table_search_cubit.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/table_search/table_search_state.dart';
import '../../../../tables/presentation/bloc/table_view_bloc.dart';
import '../../pages/seat_count_page.dart';
import 'table_card.dart';

class GridContent extends StatelessWidget {
  const GridContent({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TableViewBloc>().state;

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
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
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
              onTap: () {
                final availableSeats = table.seats - table.occupiedSeats;

                if (availableSeats <= 0) {
                  RmsSnackbar.show(
                    context,
                    message:
                        'Table ${table.name} is full. Choose another table or checkout current guests.',
                    type: RmsSnackbarType.error,
                  );
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (innerContext) => SeatCountPage(
                      tableName: table.name,
                      tableId: table.id,
                      availableSeats: availableSeats,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
