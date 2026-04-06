import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/order_filter/order_filter_cubit.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/orders/orders_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/orders/orders_event.dart';
import 'package:waiter_portal/features/orders/presentation/pages/table_list_page.dart';
import 'package:waiter_portal/features/orders/presentation/widgets/orders_page_body/orders_page_body.dart';
import 'package:waiter_portal/core/di/injector.dart';
import '../widgets/orders_page/components/orders_app_bar.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OrderFilterCubit()),
        BlocProvider(create: (context) => getIt<OrdersBloc>()..add(LoadOrders())),
      ],
      child: Scaffold(
        backgroundColor: NeutralColors.background,
        appBar: const OrdersAppBar(),
        body: const OrdersPageBody(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: PrimaryColors.defaultColor,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: NeutralColors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TableListPage()),
            );
          },
        ),
      ),
    );
  }
}
