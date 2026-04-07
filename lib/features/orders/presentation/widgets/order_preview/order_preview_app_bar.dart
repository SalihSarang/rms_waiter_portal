import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/order/order_bloc.dart';
import '../../bloc/order/order_state.dart';
import '../../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../../auth/presentation/bloc/auth_state.dart';

/// [OrderPreviewAppBar] is a stylized AppBar for the order preview screen.
class OrderPreviewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const OrderPreviewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: NeutralColors.background,
      elevation: 0,
      leading: IconButton(
        icon: const HugeIcon(
          icon: HugeIcons.strokeRoundedArrowLeft01,
          color: NeutralColors.icon,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      titleSpacing: 0,
      title: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, orderState) {
          final order = orderState is OrderInProgress ? orderState.order : null;
          final tableNumber = order?.tableNumber ?? '--';
          final orderId = order?.id ?? 'PENDING';
          // Use last 4 digits for a cleaner display code
          final shortCode = orderId.length > 4
              ? orderId.substring(orderId.length - 4)
              : orderId;

          return BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              final waiterName = authState is Authenticated
                  ? authState.staff.name
                  : 'Unknown';

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Order Summary',
                        style: TextStyle(
                          color: NeutralColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Text(
                            'Table',
                            style: TextStyle(
                              color: TableColors.round,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            tableNumber,
                            style: const TextStyle(
                              color: TableColors.round,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '# $shortCode',
                          style: const TextStyle(
                            color: NeutralColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Text(
                              'Waiter:',
                              style: TextStyle(
                                color: NeutralColors.icon,
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              waiterName,
                              style: const TextStyle(
                                color: NeutralColors.icon,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
