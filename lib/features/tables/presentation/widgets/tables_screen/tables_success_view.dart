import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/table_view_bloc.dart';
import 'hall_selector_grid.dart';
import 'tables_screen_app_bar.dart';

class TablesSuccessView extends StatelessWidget {
  const TablesSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final halls = context.watch<TableViewBloc>().state.halls;

    if (halls.isEmpty) {
      return const Scaffold(
        backgroundColor: NeutralColors.background,
        appBar: TablesScreenAppBar(),
        body: Center(
          child: Text(
            'No floor sections available.\nManagers need to create them first.',
            textAlign: TextAlign.center,
            style: TextStyle(color: NeutralColors.icon, fontSize: 16),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: NeutralColors.background,
      appBar: const TablesScreenAppBar(),
      body: HallSelectorGrid(halls: halls),
    );
  }
}
