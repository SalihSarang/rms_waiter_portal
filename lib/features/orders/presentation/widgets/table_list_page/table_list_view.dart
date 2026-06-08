import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'table_filter_row.dart';
import 'table_list_search_content.dart';

class TableListView extends StatelessWidget {
  final List<TableModel> tables;

  const TableListView({super.key, required this.tables});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TableFilterRow(),
          TableListSearchContent(tables: tables),
        ],
      ),
    );
  }
}
