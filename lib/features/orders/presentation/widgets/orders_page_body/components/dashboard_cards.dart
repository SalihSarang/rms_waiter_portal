import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/orders/orders_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/orders/orders_state.dart';
import 'dashboard_card.dart';

class DashboardCards extends StatelessWidget {
  const DashboardCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: IntrinsicHeight(
        child: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) {
            String servedCount = '---';
            String totalEarnings = '---';
            String pendingCount = '---';

            if (state is OrdersLoaded) {
              final orders = state.orders;

              final completedOrders = orders
                  .where((order) => order.orderStatus.name == 'completed')
                  .toList();
              servedCount = completedOrders.length.toString();

              final earnings = completedOrders.fold<double>(
                0,
                (sum, order) => sum + order.totalAmount,
              );
              totalEarnings = '₹${earnings.toStringAsFixed(0)}';

              final pendingOrders = orders
                  .where((order) => order.orderStatus.name == 'pending')
                  .toList();
              pendingCount = pendingOrders.length.toString();
            } else if (state is OrdersInitial || state is OrdersLoading) {
              servedCount = '...';
              totalEarnings = '...';
              pendingCount = '...';
            } else if (state is OrdersError) {
              servedCount = '0';
              totalEarnings = '₹0';
              pendingCount = '0';
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: DashboardCard(
                    title: 'ORDER SERVED',
                    value: servedCount,
                    icon: const HugeIcon(
                      icon: HugeIcons.strokeRoundedWaiter,
                      color: PrimaryColors.defaultColor,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: DashboardCard(
                    title: 'EARNINGS',
                    value: totalEarnings,
                    icon: const HugeIcon(
                      icon: HugeIcons.strokeRoundedCash01,
                      color: PrimaryColors.brandGreen,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: DashboardCard(
                    title: 'PENDING ORDERS',
                    value: pendingCount,
                    icon: const HugeIcon(
                      icon: HugeIcons.strokeRoundedInvoice01,
                      color: PrimaryColors.defaultColor,
                      size: 24,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
