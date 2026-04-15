import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:waiter_portal/features/home/presentation/bloc/main_screen/main_screen_cubit.dart';
import '../widgets/main_screen/main_screen_body.dart';
import '../widgets/main_screen/main_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenCubit(),
      child: const Scaffold(
        backgroundColor: NeutralColors.background,
        body: MainScreenBody(),
        bottomNavigationBar: MainBottomNavBar(),
      ),
    );
  }
}
