import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';

import '../../../../core/di/injector.dart';
import '../../../tables/presentation/bloc/table_view_bloc.dart';
import '../../../tables/presentation/bloc/table_view_event.dart';
import '../widgets/table_list_page/table_list_app_bar.dart';
import '../bloc/table_search/table_search_cubit.dart';
import '../widgets/table_list_page/table_list_body.dart';

class TableListPage extends StatelessWidget {
  const TableListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<TableViewBloc>()..add(TableViewInit()),
        ),
        BlocProvider(create: (context) => getIt<TableSearchCubit>()),
      ],
      child: Scaffold(
        backgroundColor: NeutralColors.background,
        appBar: const TableListAppBar(),
        body: const TableListBody(),
      ),
    );
  }
}
