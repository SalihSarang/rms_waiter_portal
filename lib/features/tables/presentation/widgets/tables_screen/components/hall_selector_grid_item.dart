import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../../bloc/table_view_bloc.dart';
import '../../../bloc/table_view_event.dart';
import 'package:waiter_portal/features/tables/presentation/pages/hall_layout_view_page.dart';
import 'package:waiter_portal/features/tables/presentation/widgets/hall_selector_card.dart';

class HallSelectorGridItem extends StatelessWidget {
  final HallModel hall;

  const HallSelectorGridItem({super.key, required this.hall});

  @override
  Widget build(BuildContext context) {
    return HallSelectorCard(
      hall: hall,
      onTap: () {
        final bloc = context.read<TableViewBloc>();
        bloc.add(TableViewHallSelected(hall));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: bloc,
              child: HallLayoutViewPage(hall: hall),
            ),
          ),
        );
      },
    );
  }
}
