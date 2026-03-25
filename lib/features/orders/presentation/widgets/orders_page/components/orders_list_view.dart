import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

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
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: mockOrders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return _OrderCard(order: mockOrders[index]);
      },
    );
  }
}

class _OrderCard extends StatelessWidget {
  final OrderModel order;

  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(order.orderStatus);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: NeutralColors.border.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Table ${order.tableNumber}',
                style: const TextStyle(
                  color: NeutralColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: statusColor.withValues(alpha: 0.5)),
                ),
                child: Text(
                  order.orderStatus.name.toUpperCase(),
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Order #${order.id}',
            style: const TextStyle(color: NeutralColors.icon, fontSize: 12),
          ),
          const SizedBox(height: 16),
          const Divider(color: NeutralColors.border),
          const SizedBox(height: 12),
          ...order.orderedMenu.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${item.quantity}x ${item.name}',
                    style: const TextStyle(
                      color: NeutralColors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: NeutralColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Divider(color: NeutralColors.border),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  color: NeutralColors.icon,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '\$${order.totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: SemanticColors.success,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return SemanticColors.info;
      case OrderStatus.preparing:
        return SemanticColors.warning;
      case OrderStatus.ready:
        return SemanticColors.success;
    }
  }
}
