import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
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
    required this.tableName,
    required this.capacity,
  });

  @override
  Widget build(BuildContext context) {
    if (capacity <= 0) {
      return Scaffold(
        backgroundColor: const Color(0xFF0A0E14),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Error', style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline,
                  color: SemanticColors.error, size: 48),
              const SizedBox(height: 16),
              Text(
                'Invalid Table Capacity ($capacity)',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'Please contact a manager to check the capacity setup.',
                style: TextStyle(color: Colors.grey, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

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
