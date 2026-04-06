import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/seat_count/seat_count_cubit.dart';

// --- Custom Page Widgets ---
import '../widgets/seat_count_page/seat_selection_app_bar.dart';
import '../widgets/seat_count_page/seat_selection_header.dart';
import '../widgets/seat_count_page/seat_count_presets.dart';
import '../widgets/seat_count_page/seat_count_grid.dart';
import '../widgets/seat_count_page/seat_selection_footer.dart';
import '../widgets/seat_count_page/seat_count_error_app_bar.dart';
import '../widgets/seat_count_page/seat_count_error_body.dart';

/// [SeatCountPage] is the interface used for selecting the number of guests.
/// 
/// It acts as a mandatory transition between the [TableListPage] and 
/// the [MenuePage], ensuring the system captures the correct occupancy.
/// 
/// ### Components used in this page:
/// 1. [SeatSelectionAppBar] - Custom top bar for table info.
/// 2. [SeatSelectionHeader] - Page title and instructions.
/// 3. [SeatCountPresets] - Quick buttons (Couple, Family, Group).
/// 4. [SeatCountGrid] - Numerical grid of [GuestCountButton].
/// 5. [SeatSelectionFooter] - Bottom status and Continue button.
/// 6. [SeatCountErrorAppBar] / [SeatCountErrorBody] - Fallback for invalid table setup.
/// 
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
    // GUARD: If the table has a capacity of 0 or less, show the Error state widgets.
    if (capacity <= 0) {
      return Scaffold(
        backgroundColor: NeutralColors.background,
        appBar: const SeatCountErrorAppBar(),
        body: SeatCountErrorBody(capacity: capacity),
      );
    }

    // MAIN STATE: Provides the [SeatCountCubit] to all child components.
    return BlocProvider(
      create: (context) => SeatCountCubit(),
      child: Scaffold(
        backgroundColor: NeutralColors.background,
        appBar: SeatSelectionAppBar(tableName: tableName, capacity: capacity),
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
