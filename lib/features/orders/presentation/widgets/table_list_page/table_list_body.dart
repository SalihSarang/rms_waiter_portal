import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../tables/presentation/bloc/table_view_bloc.dart';
import '../../../../tables/presentation/bloc/table_view_state.dart';
import 'table_list_error_view.dart';
import 'table_list_view.dart';

class TableListBody extends StatelessWidget {
  const TableListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableViewBloc, TableViewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final error = state.error;
        if (error != null) {
          return TableListErrorView(message: error);
        }

        return TableListView(tables: state.tables);
      },
    );
  }
}
