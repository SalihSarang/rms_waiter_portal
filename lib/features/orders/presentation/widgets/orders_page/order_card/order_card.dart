import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

import 'components/order_action_buttons.dart';

/// A card widget that displays the details of a single [OrderModel].
///
/// It shows the table number, order status, order ID, item count, and time since
/// the order was placed. It also includes action buttons for managing the order.
class OrderCard extends StatelessWidget {
  /// The order data to display.
  final OrderModel order;

  const OrderCard({super.key, required this.order});

  /// Helper method to calculate the relative time string (e.g., "5 min ago").
  String _getTimeAgo(DateTime createdAt) {
    final diff = DateTime.now().difference(createdAt);
    if (diff.inDays > 0) return '${diff.inDays} days ago';
    if (diff.inHours > 0) return '${diff.inHours} hours ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes} min ago';
    return 'Just now';
  }

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String statusText;

    switch (order.orderStatus) {
      case OrderStatus.pending:
        statusColor = StatusColors.pending;
        statusText = 'PENDING';
        break;
      case OrderStatus.preparing:
        statusColor = StatusColors.preparing;
        statusText = 'PREPARING';
        break;
      case OrderStatus.ready:
        statusColor = StatusColors.ready;
        statusText = 'READY';
        break;
      case OrderStatus.served:
        statusColor = StatusColors.purpleLight;
        statusText = 'SERVED';
        break;
      case OrderStatus.completed:
        statusColor = StatusColors.ready;
        statusText = 'COMPLETED';
        break;
    }

    return Container(
      // --- Main Card Container ---
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // --- Header Row: Table Number & Status Chip ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Table Number Text
              Text(
                'Table ${order.tableNumber}',
                style: const TextStyle(
                  color: TextColors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Status Chip Display
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  statusText,
                  style: const TextStyle(
                    color: TextColors.primary,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // --- Order ID Text ---
          Text(
            'ORDER #${order.id}',
            style: const TextStyle(
              color: NeutralColors.icon,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          // --- Metadata Row: Items Count & Time Ago ---
          Row(
            children: [
              // Items Count
              const Icon(Icons.restaurant, color: NeutralColors.icon, size: 16),
              const SizedBox(width: 8),
              Text(
                '${order.orderedMenu.length} items',
                style: const TextStyle(color: NeutralColors.icon, fontSize: 13),
              ),
              const SizedBox(width: 24),
              // Time Ago
              const Icon(
                Icons.access_time,
                color: NeutralColors.icon,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                _getTimeAgo(order.createdAt),
                style: const TextStyle(color: NeutralColors.icon, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // --- Action Buttons Section ---
          OrderActionButtons(order: order),
        ],
      ),
    );
  }
}
