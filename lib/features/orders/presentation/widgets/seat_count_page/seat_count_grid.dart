import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/seat_count/seat_count_cubit.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/seat_count/seat_count_state.dart';
import 'guest_count_button.dart';

/// [SeatCountGrid] is a widget that displays a grid of [GuestCountButton] widgets.
///
/// It uses the [SeatCountCubit] to manage the selected guest count and renders
/// buttons for each number from 1 up to the table's capacity.
class SeatCountGrid extends StatelessWidget {
  final int capacity;

  const SeatCountGrid({super.key, required this.capacity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: NeutralColors.card,
              border: Border.all(color: NeutralColors.border),
              borderRadius: BorderRadius.circular(20),
            ),
            child: BlocBuilder<SeatCountCubit, SeatCountState>(
              builder: (context, state) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: capacity,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final count = index + 1;
                    final isSelected = state.selectedCount == count;
                    return GuestCountButton(
                      count: count,
                      isSelected: isSelected,
                      onTap: () =>
                          context.read<SeatCountCubit>().selectCount(count),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
