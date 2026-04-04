import 'package:flutter/material.dart';
import 'package:waiter_portal/features/orders/presentation/widgets/orders_page/components/orders_list_view.dart';
import 'package:waiter_portal/features/orders/presentation/widgets/orders_page_body/components/dashboard_cards.dart';

class OrdersPageBody extends StatelessWidget {
  const OrdersPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: IntrinsicHeight(
            child: DashboardCards(),
          ),
        ),
        const Expanded(child: OrdersListView()),
      ],
    );
  }
}
