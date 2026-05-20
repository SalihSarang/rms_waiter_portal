import 'package:flutter/material.dart';
import '../../../../tables/presentation/bloc/table_view_state.dart';
import 'hall_filter_list.dart';

class HallFilterScrollView extends StatelessWidget {
  final TableViewState state;

  const HallFilterScrollView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: HallFilterList(state: state),
    );
  }
}
