import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../../bloc/table_view_bloc.dart';
import '../../../bloc/table_view_event.dart';
import '../../../bloc/table_view_state.dart';
import '../../hall_selector_card.dart';
import '../../../pages/hall_layout_view_page.dart';

class TablesScreenBody extends StatelessWidget {
  const TablesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableViewBloc, TableViewState>(
      builder: (context, state) {
        if (state.isLoading && state.halls.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: PrimaryColors.defaultColor),
          );
        }

        if (state.error != null && state.halls.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline_rounded, color: SemanticColors.error, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    'Failed to load floor sections:\n${state.error}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: SemanticColors.error, fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => context.read<TableViewBloc>().add(TableViewInit()),
                    style: ElevatedButton.styleFrom(backgroundColor: PrimaryColors.defaultColor),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state.halls.isEmpty) {
          return const Center(
            child: Text(
              'No floor sections available.\nManagers need to create them first.',
              textAlign: TextAlign.center,
              style: TextStyle(color: NeutralColors.icon, fontSize: 16),
            ),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2, // Taller aspect ratio guarantees card contents fit nicely
          ),
          itemCount: state.halls.length,
          itemBuilder: (context, index) {
            final hall = state.halls[index];
            return HallSelectorCard(
              hall: hall,
              onTap: () {
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
      },
    );
  }
}
