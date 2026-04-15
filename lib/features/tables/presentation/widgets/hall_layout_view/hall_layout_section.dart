import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/orders/presentation/pages/menu_page.dart';
import '../../bloc/table_view_bloc.dart';
import '../../bloc/table_view_state.dart';
import '../table_view_canvas.dart';

class HallLayoutSection extends StatelessWidget {
  const HallLayoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableViewBloc, TableViewState>(
      builder: (context, state) {
        if (state.isLoading && state.tables.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: PrimaryColors.defaultColor),
          );
        }
        if (state.error != null && state.tables.isEmpty) {
          return Center(
            child: Text(
              'Failed to load tables:\n${state.error}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: SemanticColors.error),
            ),
          );
        }

        return Stack(
          children: [
            TableViewCanvas(
              onTableTap: (table) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuPage(tableNumber: table.name),
                  ),
                );
              },
            ),
            if (state.isLoading)
              const Positioned(
                top: 16,
                right: 16,
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: PrimaryColors.defaultColor,
                    strokeWidth: 2,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
