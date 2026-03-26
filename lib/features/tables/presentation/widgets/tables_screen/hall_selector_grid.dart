import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../bloc/table_view_bloc.dart';
import '../../pages/hall_layout_view_page.dart';
import '../hall_selector_card.dart';

/// A grid layout that displays all available floor sections (halls)
/// allowing users to select one to view its detailed table layout.
class HallSelectorGrid extends StatelessWidget {
  final List<HallModel> halls;

  const HallSelectorGrid({super.key, required this.halls});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // GRIDVIEW: Arrangement of hall selector cards
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: halls.length,
      itemBuilder: (context, index) {
        final hall = halls[index];
        return HallSelectorCard(
          hall: hall,
          onTap: () {
            // NAVIGATION: Move to the detailed layout view for the selected hall
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<TableViewBloc>(),
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
