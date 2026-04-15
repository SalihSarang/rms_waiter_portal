import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../orders/presentation/bloc/orders/orders_bloc.dart';
import '../../../orders/presentation/bloc/orders/orders_state.dart';
import '../../../shift/presentation/bloc/shift_bloc.dart';
import '../../../shift/presentation/bloc/shift_state.dart';
import '../utils/profile_utils.dart';
import 'profile_stats_card.dart';

class ProfileStatsRow extends StatelessWidget {
  const ProfileStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final staffId = context.select(
      (AuthBloc b) => (b.state is Authenticated)
          ? (b.state as Authenticated).staff.id
          : null,
    );
    if (staffId == null) return const SizedBox.shrink();

    final shiftState = context.watch<ShiftBloc>().state;
    String shiftDuration = '0h 0m';
    if (shiftState is ShiftActive) {
      shiftDuration = ProfileUtils.calculateDuration(shiftState.startTime);
    }

    final ordersState = context.watch<OrdersBloc>().state;
    String todaySales = '₹0';
    if (ordersState is OrdersLoaded) {
      todaySales = ProfileUtils.calculateTodaySales(
        ordersState.orders,
        staffId,
      );
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: NeutralColors.border.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: ProfileStatsCard(
              icon: Icons.access_time_filled,
              label: 'SHIFT TIME',
              value: shiftDuration,
              iconColor: Colors.blueAccent,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ProfileStatsCard(
              icon: Icons.monetization_on,
              label: "TODAY'S ORDER",
              value: todaySales,
              iconColor: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
