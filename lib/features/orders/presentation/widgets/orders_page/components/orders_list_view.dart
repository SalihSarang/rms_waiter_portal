import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/orders/orders_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/orders/orders_state.dart';
import '../order_card/order_card.dart';
import 'list_view/order_filter_helper.dart';
import 'list_view/orders_empty_view.dart';
import 'list_view/orders_error_view.dart';
import 'list_view/orders_loading_view.dart';

import '../../../../domain/enums/order_filter.dart';

class OrdersListView extends StatelessWidget {
  final OrderFilter selectedFilter;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  const OrdersListView({
    super.key,
    required this.selectedFilter,
    this.physics,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        if (state is OrdersLoading) return const OrdersLoadingView();
        if (state is OrdersError) return const OrdersErrorView();

        if (state is OrdersLoaded) {
          final filteredOrders = OrderFilterHelper.filterOrders(
            state.orders,
            selectedFilter,
          );

          if (filteredOrders.isEmpty) return const OrdersEmptyView();

          return ListView.separated(
            physics: physics,
            shrinkWrap: shrinkWrap,
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 20,
              top: 10,
            ),
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
