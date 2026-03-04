import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:waiter_portal/features/alerts/presentation/pages/alerts_screen.dart';
import 'package:waiter_portal/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:waiter_portal/features/orders/presentation/pages/orders_screen.dart';
import 'package:waiter_portal/features/profile/presentation/pages/profile_screen.dart';
import 'package:waiter_portal/features/tables/presentation/pages/tables_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    OrdersScreen(),
    TablesScreen(),
    AlertsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeutralColors.background,
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
