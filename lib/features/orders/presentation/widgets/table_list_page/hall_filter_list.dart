import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../tables/presentation/bloc/table_view_bloc.dart';
import '../../../../tables/presentation/bloc/table_view_event.dart';
import '../../../../tables/presentation/bloc/table_view_state.dart';
import 'table_filter_chip.dart';

class HallFilterList extends StatelessWidget {
  final TableViewState state;

  const HallFilterList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
