import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/core/widgets/custom_bottom_nav_bar.dart';
import 'package:waiter_portal/features/home/presentation/bloc/main_screen/main_screen_cubit.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.watch<MainScreenCubit>().state;

    return CustomBottomNavBar(
      selectedIndex: selectedIndex,
      onItemSelected: (index) {
        context.read<MainScreenCubit>().setIndex(index);
      },
    );
  }
}
