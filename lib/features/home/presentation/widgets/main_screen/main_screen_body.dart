import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/features/alerts/presentation/pages/alerts_screen.dart';
import 'package:waiter_portal/features/home/presentation/bloc/main_screen/main_screen_cubit.dart';
import 'package:waiter_portal/features/orders/presentation/pages/orders_page.dart';
import 'package:waiter_portal/features/profile/presentation/pages/profile_screen.dart';
import 'package:waiter_portal/features/tables/presentation/pages/tables_screen.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.watch<MainScreenCubit>().state;

    return IndexedStack(
      index: selectedIndex,
      children: const [
        OrdersPage(),
        TablesScreen(),
        AlertsScreen(),
        ProfileScreen(),
      ],
    );
  }
}
