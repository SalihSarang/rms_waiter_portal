import 'package:flutter/material.dart';
import 'table_grid_item.dart';
import 'package:rms_shared_package/models/table_models/table_model.dart';

class TableGrid extends StatelessWidget {
  final List<TableModel> tables;

  const TableGrid({super.key, required this.tables});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      itemCount: tables.length,
      itemBuilder: (context, index) {
        final table = tables[index];
        return TableGridItem(table: table);
      },
    );
  }
}
