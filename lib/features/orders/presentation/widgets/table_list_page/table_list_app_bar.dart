import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/table_search/table_search_cubit.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/table_search/table_search_state.dart';

class TableListAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TableListAppBar({super.key});

  @override
  State<TableListAppBar> createState() => _TableListAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TableListAppBarState extends State<TableListAppBar> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableSearchCubit, TableSearchState>(
      builder: (context, state) {
        return AppBar(
          backgroundColor: NeutralColors.background,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: TextColors.primary,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: state.isSearchVisible
              ? TextField(
                  controller: _searchController,
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
                )
              : const Text(
                  'Select Table',
                  style: TextStyle(
                    color: TextColors.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                state.isSearchVisible ? Icons.close : Icons.search,
                color: TextColors.primary,
              ),
              onPressed: () {
                if (state.isSearchVisible) {
                  _searchController.clear();
                }
                context.read<TableSearchCubit>().toggleSearch();
              },
            ),
          ],
        );
      },
    );
  }
}
