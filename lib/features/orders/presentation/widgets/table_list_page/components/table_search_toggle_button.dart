import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../../bloc/table_search/table_search_cubit.dart';

class TableSearchToggleButton extends StatelessWidget {
  final bool isSearchVisible;
  final TextEditingController controller;

  const TableSearchToggleButton({
    super.key,
    required this.isSearchVisible,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isSearchVisible ? Icons.close : Icons.search,
        color: TextColors.primary,
      ),
      onPressed: () {
        if (isSearchVisible) {
          controller.clear();
        }
        context.read<TableSearchCubit>().toggleSearch();
      },
    );
  }
}
