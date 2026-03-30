import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/table_view_bloc.dart';
import '../../bloc/table_view_event.dart';
import '../../bloc/table_view_state.dart';
import 'hall_selector_grid.dart';
import 'tables_error_view.dart';

class TablesScreenBody extends StatelessWidget {
  const TablesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableViewBloc, TableViewState>(
      builder: (context, state) {
        if (state.isLoading && state.halls.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: PrimaryColors.defaultColor),
          );
        }

        if (state.error != null && state.halls.isEmpty) {
          return TablesErrorView(
            error: state.error!,
            onRetry: () => context.read<TableViewBloc>().add(TableViewInit()),
          );
        }

        if (state.halls.isEmpty) {
          return const Center(
            child: Text(
              'No floor sections available.\nManagers need to create them first.',
              textAlign: TextAlign.center,
              style: TextStyle(color: NeutralColors.icon, fontSize: 16),
            ),
          );
        }

        return HallSelectorGrid(halls: state.halls);
      },
    );
  }
}
