import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../../bloc/table_search/table_search_cubit.dart';

class TableSearchField extends StatelessWidget {
  final TextEditingController controller;

  const TableSearchField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      style: const TextStyle(
        color: TextColors.primary,
        fontSize: 16,
      ),
      decoration: const InputDecoration(
        hintText: 'Search tables...',
        hintStyle: TextStyle(
          color: NeutralColors.icon,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        border: InputBorder.none,
      ),
      onChanged: (value) {
        context.read<TableSearchCubit>().updateSearch(value);
      },
    );
  }
}
