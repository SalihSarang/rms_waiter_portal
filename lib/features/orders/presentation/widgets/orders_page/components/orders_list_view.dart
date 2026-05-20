import 'package:flutter/material.dart';
<<<<<<< HEAD
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
=======
import 'package:rms_shared_package/rms_shared_package.dart';
import '../order_card/order_card.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final mockOrders = [
      OrderModel(
        id: '1',
        tableNumber: '5',
        totalAmount: 45.50,
        orderStatus: OrderStatus.preparing,
        paymentStatus: PaymentStatus.pending,
        seatCount: 4,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        orderedMenu: [
          CartItemModel(
            foodId: '1',
            name: 'Grilled Salmon',
            quantity: 1,
            price: 25.0,
            selectedPortion: PortionAndPrice(name: 'Large', price: 25.0),
            selectedAddOns: [],
          ),
          CartItemModel(
            foodId: '2',
            name: 'Mango Smoothie',
            quantity: 2,
            price: 10.25,
            selectedPortion: PortionAndPrice(name: 'Medium', price: 10.25),
            selectedAddOns: [],
          ),
        ],
      ),
      OrderModel(
        id: '2',
        tableNumber: '8',
        totalAmount: 12.00,
        orderStatus: OrderStatus.pending,
        paymentStatus: PaymentStatus.pending,
        seatCount: 2,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        orderedMenu: [
          CartItemModel(
            foodId: '3',
            name: 'Classic Burger',
            quantity: 1,
            price: 12.0,
            selectedPortion: PortionAndPrice(name: 'Regular', price: 12.0),
            selectedAddOns: [],
          ),
        ],
      ),
      OrderModel(
        id: '2',
        tableNumber: '8',
        totalAmount: 12.00,
        orderStatus: OrderStatus.ready,
        paymentStatus: PaymentStatus.pending,
        seatCount: 2,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        orderedMenu: [
          CartItemModel(
            foodId: '3',
            name: 'Classic Burger',
            quantity: 1,
            price: 12.0,
            selectedPortion: PortionAndPrice(name: 'Regular', price: 12.0),
            selectedAddOns: [],
          ),
        ],
      ),
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: mockOrders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return OrderCard(order: mockOrders[index]);
>>>>>>> origin/main
      },
    );
  }
}
