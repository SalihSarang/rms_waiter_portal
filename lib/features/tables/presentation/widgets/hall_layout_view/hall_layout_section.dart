import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/table_view_bloc.dart';
import '../../bloc/table_view_state.dart';
import 'hall_layout_content_view.dart';
import 'hall_layout_error_view.dart';
import 'hall_layout_initial_loading_view.dart';

class HallLayoutSection extends StatelessWidget {
  const HallLayoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableViewBloc, TableViewState>(
      builder: (context, state) {
        if (state.isLoading && state.tables.isEmpty) {
          return const HallLayoutInitialLoadingView();
        }
        if (state.error != null && state.tables.isEmpty) {
          return HallLayoutErrorView(error: state.error!);
        }

        return HallLayoutContentView(isLoading: state.isLoading);
      },
    );
  }
}
