import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/order_filter/order_filter_cubit.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/order_filter/order_filter_state.dart';
import 'package:waiter_portal/features/orders/presentation/widgets/orders_page/components/orders_list_view.dart';
import 'package:waiter_portal/features/orders/presentation/widgets/orders_page_body/components/dashboard_cards.dart';
import 'package:waiter_portal/features/orders/presentation/widgets/orders_page_body/components/order_filter_row.dart';
import 'package:rms_design_system/rms_design_system.dart';

class OrdersPageBody extends StatelessWidget {
  const OrdersPageBody({super.key});

  final List<String> filters = const [
    'All',
    'Preparing',
    'Ready',
    'Bill Requested',
    'Completed',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderFilterCubit, OrderFilterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: IntrinsicHeight(child: DashboardCards()),
            ),
            OrderFilterRow(
              selectedFilter: state.selectedFilter,
              filters: filters,
              onFilterChanged: (filter) {
                context.read<OrderFilterCubit>().setFilter(filter);
              },
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.selectedFilter == 'All'
                        ? 'Active Orders'
                        : state.selectedFilter,
                    style: const TextStyle(
                      color: NeutralColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All Order',
                      style: TextStyle(
                        color: PrimaryColors.defaultColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: OrdersListView(selectedFilter: state.selectedFilter),
            ),
          ],
        );
      },
    );
  }
}
