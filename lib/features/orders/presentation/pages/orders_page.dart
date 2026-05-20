import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/order_filter/order_filter_cubit.dart';
import 'package:waiter_portal/features/orders/presentation/pages/table_list_page.dart';
import 'package:waiter_portal/features/orders/presentation/widgets/orders_page_body/orders_page_body.dart';
import '../bloc/cart/cart_bloc.dart';
import '../bloc/cart/cart_event.dart';
import '../widgets/orders_page/components/orders_app_bar.dart';
=======
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/orders/presentation/pages/table_list_page.dart';

import '../widgets/orders_page/components/orders_app_bar.dart';
import '../widgets/orders_page/components/orders_list_view.dart';
>>>>>>> origin/main

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => OrderFilterCubit())],
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: NeutralColors.background,
            appBar: const OrdersAppBar(),
            body: const OrdersPageBody(),
            floatingActionButton: FloatingActionButton(
              backgroundColor: PrimaryColors.defaultColor,
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: NeutralColors.white),
              onPressed: () {
                // Clear the cart before starting a new order flow
                context.read<CartBloc>().add(ClearCartEvent());

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (innerContext) => const TableListPage(),
                  ),
                );
              },
            ),
=======
    return Scaffold(
      backgroundColor: NeutralColors.background,
      appBar: const OrdersAppBar(),
      body: const OrdersListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: PrimaryColors.defaultColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: NeutralColors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TableListPage()),
>>>>>>> origin/main
          );
        },
      ),
    );
  }
}
