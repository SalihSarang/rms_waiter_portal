import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/table_search/table_search_cubit.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/table_search/table_search_state.dart';
import 'components/table_list_back_button.dart';
import 'components/table_search_field.dart';
import 'components/table_search_toggle_button.dart';

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
          leading: const TableListBackButton(),
          title: state.isSearchVisible
              ? TableSearchField(controller: _searchController)
              : const RmsAppBarTitle('Select Table'),
          centerTitle: true,
          actions: [
            TableSearchToggleButton(
              isSearchVisible: state.isSearchVisible,
              controller: _searchController,
            ),
          ],
        );
      },
    );
  }
}
