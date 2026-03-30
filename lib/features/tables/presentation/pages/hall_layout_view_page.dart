import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../bloc/table_view_bloc.dart';
import '../bloc/table_view_event.dart';
import '../widgets/hall_layout_view/components/hall_layout_app_bar.dart';
import '../widgets/hall_layout_view/components/hall_layout_body.dart';

/// A full-screen view for displaying a specific hall's layout with interactive table elements.
class HallLayoutViewPage extends StatefulWidget {
  final HallModel hall;

  const HallLayoutViewPage({super.key, required this.hall});

  @override
  State<HallLayoutViewPage> createState() => _HallLayoutViewPageState();
}

class _HallLayoutViewPageState extends State<HallLayoutViewPage> {
  @override
  void initState() {
    super.initState();
    // INITIALIZE: Tell the bloc to load data specifically for this hall
    context.read<TableViewBloc>().add(TableViewHallSelected(widget.hall));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeutralColors.background,
      appBar: HallLayoutAppBar(hall: widget.hall),
      body: const HallLayoutBody(),
    );
  }
}
