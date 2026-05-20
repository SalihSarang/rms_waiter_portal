import 'package:flutter/material.dart';
<<<<<<< HEAD
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
            child: CircularProgressIndicator(color: PrimaryColors.defaultColor),
          );
        }

        if (state is OrdersError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: SemanticColors.error,
                  size: 48,
                ),
                const SizedBox(height: 16),
                Text(
                  'Failed to load orders',
                  style: TextStyle(
                    color: NeutralColors.white.withValues(alpha: 0.7),
                  ),
                ),
                TextButton(
                  onPressed: () => context.read<OrdersBloc>().add(LoadOrders()),
                  child: const Text(
                    'Retry',
                    style: TextStyle(color: PrimaryColors.defaultColor),
                  ),
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
                  Icon(
                    Icons.receipt_long_rounded,
                    color: NeutralColors.white.withValues(alpha: 0.2),
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No orders found',
                    style: TextStyle(
                      color: NeutralColors.white.withValues(alpha: 0.5),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
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
