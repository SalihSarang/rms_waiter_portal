import 'package:flutter/material.dart';
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
      },
    );
  }
}
