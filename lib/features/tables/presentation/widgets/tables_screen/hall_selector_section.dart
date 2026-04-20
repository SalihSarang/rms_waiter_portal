import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/table_view_bloc.dart';
import 'components/hall_selector_empty_view.dart';
import 'components/hall_selector_error_view.dart';
import 'components/hall_selector_grid_view.dart';
import 'components/hall_selector_loading_view.dart';

class HallSelectorSection extends StatelessWidget {
  const HallSelectorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TableViewBloc>().state;

    if (state.isLoading && state.halls.isEmpty) {
      return const HallSelectorLoadingView();
    }

    if (state.error != null && state.halls.isEmpty) {
      return HallSelectorErrorView(state: state);
    }

    if (!state.isLoading && state.halls.isEmpty) {
      return const HallSelectorEmptyView();
    }

    // Success State (The Grid)
    return HallSelectorGridView(halls: state.halls);
  }
}
