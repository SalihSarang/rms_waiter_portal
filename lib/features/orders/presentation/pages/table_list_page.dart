import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';

import '../../../../core/di/injector.dart';
import '../../../tables/presentation/bloc/table_view_bloc.dart';
import '../../../tables/presentation/bloc/table_view_event.dart';
import '../../../tables/presentation/bloc/table_view_state.dart';
import '../widgets/table_list_page/grid_content.dart';
import '../widgets/table_list_page/table_filter_row.dart';
import '../widgets/table_list_page/table_list_app_bar.dart';
import 'seat_count_page.dart';

import '../bloc/table_search/table_search_cubit.dart';

class TableListPage extends StatelessWidget {
  const TableListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<TableViewBloc>()..add(TableViewInit()),
        ),
        BlocProvider(create: (context) => getIt<TableSearchCubit>()),
      ],
      child: BlocBuilder<TableViewBloc, TableViewState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: NeutralColors.background,
            appBar: const TableListAppBar(),
            body: Column(
              children: [
                TableFilterRow(state: state),
                const Divider(color: NeutralColors.border, height: 1),
                Expanded(
                  child: GridContent(
                    state: state,
                    onTableTap: (table) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (innerContext) => SeatCountPage(
                            tableName: table.name,
                            capacity: table.seats,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
