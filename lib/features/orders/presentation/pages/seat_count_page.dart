import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/seat_count/seat_count_cubit.dart';
import '../widgets/seat_count_page/seat_selection_app_bar.dart';
import '../widgets/seat_count_page/seat_selection_header.dart';
import '../widgets/seat_count_page/seat_count_presets.dart';
import '../widgets/seat_count_page/seat_count_grid.dart';
import '../widgets/seat_count_page/seat_selection_footer.dart';

class SeatCountPage extends StatelessWidget {
  final String tableName;
  final int capacity;

  const SeatCountPage({
    super.key,
    this.tableName = 'Table 5',
    this.capacity = 6,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeatCountCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0E14),
        appBar: SeatSelectionAppBar(
          tableName: tableName,
          capacity: capacity,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SeatSelectionHeader(),
              const SeatCountPresets(),
              SeatCountGrid(capacity: capacity),
            ],
          ),
        ),
        bottomNavigationBar: SeatSelectionFooter(
          capacity: capacity,
          tableName: tableName,
        ),
      ),
    );
  }
}
