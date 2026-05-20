import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:waiter_portal/features/bottom_nav/presentation/bloc/main_screen/main_screen_cubit.dart';
import '../widgets/main_screen/main_screen_body.dart';
import '../widgets/main_screen/main_bottom_nav_bar.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenCubit(),
      child: const Scaffold(
        backgroundColor: NeutralColors.background,
        body: BottomNavBody(),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
