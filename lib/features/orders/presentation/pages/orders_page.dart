import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/orders/presentation/pages/table_list_page.dart';

import '../widgets/orders_page/components/orders_app_bar.dart';
import '../widgets/orders_page/components/orders_list_view.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          );
        },
      ),
    );
  }
}
