import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/seat_count/seat_count_cubit.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/seat_count/seat_count_state.dart';
import '../../pages/menue_page.dart';

class SeatSelectionFooter extends StatelessWidget {
  final int capacity;
  final String tableName;

  const SeatSelectionFooter({
    super.key,
    required this.capacity,
    required this.tableName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeatCountCubit, SeatCountState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.white10)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedUserGroup,
                    color: Colors.grey,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${state.selectedCount} of $capacity seats selected',
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuePage(tableNumber: tableName),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PrimaryColors.defaultColor,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Continue to Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
