import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/seat_count/seat_count_cubit.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/seat_count/seat_count_state.dart';
import 'guest_count_button.dart';

class SeatCountGrid extends StatelessWidget {
  final int capacity;

  const SeatCountGrid({super.key, required this.capacity});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF0D121A),
                border: Border.all(color: Colors.white12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: BlocBuilder<SeatCountCubit, SeatCountState>(
                builder: (context, state) {
                  return GridView.builder(
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
          ),
        ],
      ),
    );
  }
}
