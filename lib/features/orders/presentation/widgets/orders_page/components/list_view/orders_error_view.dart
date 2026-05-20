import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/orders/orders_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/orders/orders_event.dart';

class OrdersErrorView extends StatelessWidget {
  const OrdersErrorView({super.key});

  @override
  Widget build(BuildContext context) {
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
            style: TextStyle(color: TextColors.primary.withValues(alpha: 0.7)),
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
}
