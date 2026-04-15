import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/core/di/injector.dart';

import '../bloc/table_view_bloc.dart';
import '../bloc/table_view_event.dart';
import '../bloc/table_view_state.dart';
import '../widgets/tables_screen/tables_error_view.dart';
import '../widgets/tables_screen/tables_loading_view.dart';
import '../widgets/tables_screen/tables_success_view.dart';

class TablesScreen extends StatelessWidget {
  const TablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TableViewBloc>()..add(TableViewInit()),
      child: BlocBuilder<TableViewBloc, TableViewState>(
        builder: (context, state) {
          if (state.isLoading && state.halls.isEmpty) {
            return const TablesLoadingView();
          }

          if (state.error != null && state.halls.isEmpty) {
            return TablesErrorView(
              error: state.error!,
              onRetry: () => context.read<TableViewBloc>().add(TableViewInit()),
            );
          }

          return const TablesSuccessView();
        },
      ),
    );
  }
}
