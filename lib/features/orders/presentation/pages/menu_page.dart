import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/core/di/injector.dart';
import '../bloc/menu/menu_bloc.dart';
import '../bloc/menu/menu_event.dart';
import '../bloc/menu_filter/menu_filter_cubit.dart';
import '../widgets/menu_page/menu_app_bar.dart';
import '../widgets/menu_page/menu_body.dart';
import '../widgets/menu_page/order_summary_overlay.dart';

/// [MenuPage] is the main entry point for the digital menu screen.
/// It serves as a scaffold that assembles all menu-related components:
/// [MenuAppBar], [MenuBody], and [OrderSummaryOverlay].
class MenuPage extends StatelessWidget {
  final String tableNumber;

  const MenuPage({super.key, required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<MenuBloc>()..add(FetchMenu())),
        BlocProvider(create: (context) => getIt<MenuFilterCubit>()),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: NeutralColors.background,
            appBar: MenuAppBar(tableNumber: tableNumber),
            body: SafeArea(
              child: Stack(
                children: [
                  const MenuBody(),
                  OrderSummaryOverlay(tableNumber: tableNumber),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
