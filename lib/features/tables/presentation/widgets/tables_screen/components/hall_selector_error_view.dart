import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/table_view_bloc.dart';
import '../../../bloc/table_view_event.dart';
import '../../../bloc/table_view_state.dart';
import '../tables_error_view.dart';

class HallSelectorErrorView extends StatelessWidget {
  final TableViewState state;

  const HallSelectorErrorView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return TablesErrorView(
      error: state.error!,
      onRetry: () => context.read<TableViewBloc>().add(TableViewInit()),
    );
  }
}
