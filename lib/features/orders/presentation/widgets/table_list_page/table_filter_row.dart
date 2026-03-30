import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';

import '../../../../tables/presentation/bloc/table_view_bloc.dart';
import '../../../../tables/presentation/bloc/table_view_event.dart';
import '../../../../tables/presentation/bloc/table_view_state.dart';

class TableFilterRow extends StatelessWidget {
  final TableViewState state;

  const TableFilterRow({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.halls.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          'No halls available',
          style: TextStyle(color: NeutralColors.icon),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: state.halls.map((hall) {
          final isSelected = state.selectedHall?.id == hall.id;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                context.read<TableViewBloc>().add(TableViewHallSelected(hall));
              },
              child: _buildFilterChip(
                hall.name,
                Icons.grid_view_rounded,
                isSelected: isSelected,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFilterChip(
    String label,
    IconData icon, {
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? PrimaryColors.defaultColor : NeutralColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? PrimaryColors.defaultColor : NeutralColors.border,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: isSelected ? NeutralColors.white : NeutralColors.icon,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? NeutralColors.white : NeutralColors.icon,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
