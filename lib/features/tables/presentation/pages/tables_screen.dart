import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/core/di/injector.dart';

import '../bloc/table_view_bloc.dart';
import '../bloc/table_view_event.dart';
import '../widgets/tables_screen/components/tables_screen_app_bar.dart';
import '../widgets/tables_screen/components/tables_screen_body.dart';

class TablesScreen extends StatelessWidget {
  const TablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TableViewBloc>()..add(TableViewInit()),
      child: const Scaffold(
        backgroundColor: NeutralColors.background,
        appBar: TablesScreenAppBar(),
        body: TablesScreenBody(),
      ),
    );
  }
}

