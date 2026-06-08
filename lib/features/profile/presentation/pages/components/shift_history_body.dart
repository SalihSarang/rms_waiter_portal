import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shift/presentation/bloc/shift_bloc.dart';
import '../../../../shift/presentation/bloc/shift_state.dart';
import 'shift_history_empty_view.dart';
import 'shift_history_list_view.dart';

/// The main content area of the Shift History screen, handling state-dependent UI.
class ShiftHistoryBody extends StatelessWidget {
  const ShiftHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftBloc, ShiftState>(
      builder: (context, state) {
        final history = state.data?.history ?? const [];

        if (history.isEmpty) {
          return const ShiftHistoryEmptyView();
        }

        return ShiftHistoryListView(history: history);
      },
    );
  }
}
