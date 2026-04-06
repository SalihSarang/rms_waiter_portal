import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/orders/orders_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/orders/orders_event.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/orders/orders_state.dart';
import '../order_card/order_card.dart';

class OrdersListView extends StatelessWidget {
  final String selectedFilter;
  const OrdersListView({super.key, required this.selectedFilter});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        if (state is OrdersLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: PrimaryColors.defaultColor,
            ),
          );
        }

        if (state is OrdersError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline,
                    color: SemanticColors.error, size: 48),
                const SizedBox(height: 16),
                Text(
                  'Failed to load orders',
                  style: TextStyle(color: NeutralColors.white.withOpacity(0.7)),
                ),
                TextButton(
                  onPressed: () => context.read<OrdersBloc>().add(LoadOrders()),
                  child: const Text('Retry',
                      style: TextStyle(color: PrimaryColors.defaultColor)),
                ),
              ],
            ),
          );
        }

        if (state is OrdersLoaded) {
          final orders = state.orders;

          final filteredOrders = selectedFilter == 'All'
              ? orders
              : orders
                  .where(
                    (order) =>
                        order.orderStatus.name.toLowerCase() ==
                        selectedFilter.replaceAll(' ', '').toLowerCase(),
                  )
                  .toList();

          if (filteredOrders.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.receipt_long_rounded,
                      color: NeutralColors.white.withOpacity(0.2), size: 64),
                  const SizedBox(height: 16),
                  Text(
                    'No orders found',
                    style: TextStyle(
                      color: NeutralColors.white.withOpacity(0.5),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
            itemCount: filteredOrders.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return OrderCard(order: filteredOrders[index]);
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
