import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';

import '../../../../tables/presentation/bloc/table_view_bloc.dart';
import 'hall_filter_empty_view.dart';
import 'hall_filter_scroll_view.dart';

class TableFilterRow extends StatelessWidget {
  const TableFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TableViewBloc>().state;

    if (state.halls.isEmpty) {
      return const HallFilterEmptyView();
    }

    return Column(
      children: [
        HallFilterScrollView(state: state),
        const Divider(color: NeutralColors.border, height: 1),
      ],
    );
  }
}
