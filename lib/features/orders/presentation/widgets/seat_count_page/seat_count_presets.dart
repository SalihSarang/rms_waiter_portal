import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/seat_count/seat_count_cubit.dart';
import 'guest_type_button.dart';

class SeatCountPresets extends StatelessWidget {
  const SeatCountPresets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GuestTypeButton(
              label: 'Couple',
              onTap: () => context.read<SeatCountCubit>().selectCount(2),
            ),
            GuestTypeButton(
              label: 'Family',
              onTap: () => context.read<SeatCountCubit>().selectCount(4),
            ),
            GuestTypeButton(
              label: 'Group',
              onTap: () => context.read<SeatCountCubit>().selectCount(6),
            ),
          ],
        ),
      ],
    );
  }
}
