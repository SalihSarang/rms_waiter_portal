import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/table_view_bloc.dart';
import '../../bloc/table_view_event.dart';
import '../../pages/hall_layout_view_page.dart';
import '../hall_selector_card.dart';
import 'tables_error_view.dart';

class HallSelectorSection extends StatelessWidget {
  const HallSelectorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TableViewBloc>().state;

    // Loading State (Independent Section Loader)
    if (state.isLoading && state.halls.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 100),
        child: Center(
          child: CircularProgressIndicator(color: PrimaryColors.defaultColor),
        ),
      );
    }

    // Error State
    if (state.error != null && state.halls.isEmpty) {
      return TablesErrorView(
        error: state.error!,
        onRetry: () => context.read<TableViewBloc>().add(TableViewInit()),
      );
    }

    // Empty State
    if (state.halls.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 100),
        child: Center(
          child: Text(
            'No floor sections available.\nManagers need to create them first.',
            textAlign: TextAlign.center,
            style: TextStyle(color: NeutralColors.icon, fontSize: 16),
          ),
        ),
      );
    }

    // Success State (The Grid)
    return GridView.builder(
      padding: const EdgeInsets.all(24),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: state.halls.length,
      itemBuilder: (context, index) {
        final hall = state.halls[index];
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
      },
    );
  }
}
