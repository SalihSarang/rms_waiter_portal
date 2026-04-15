import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';

import '../../../../tables/presentation/bloc/table_view_bloc.dart';
import '../../../../tables/presentation/bloc/table_view_event.dart';

import 'table_filter_chip.dart';

class TableFilterRow extends StatelessWidget {
  const TableFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TableViewBloc>().state;

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
          return TableFilterChip(
            label: hall.name,
            icon: Icons.grid_view_rounded,
            isSelected: isSelected,
            onTap: () {
              context.read<TableViewBloc>().add(TableViewHallSelected(hall));
            },
          );
        }).toList(),
      ),
    );
  }
}
