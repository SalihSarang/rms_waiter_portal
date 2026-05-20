import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/menu/menu_bloc.dart';
import '../../bloc/menu/menu_state.dart';
import 'menu_error_view.dart';
import 'menu_grid/components/menu_loading_view.dart';
import 'menu_grid_section.dart';

class MenuBody extends StatelessWidget {
  const MenuBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, menuState) {
          if (menuState is MenuError) {
            return MenuErrorView(message: menuState.message);
          }

          if (menuState is MenuLoading) {
            return const MenuLoadingView();
          }

          if (menuState is MenuLoaded) {
            return MenuGridSection(foods: menuState.foods);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
