import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';

import '../../bloc/food_details/food_details_cubit.dart';

class FoodDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FoodDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final food = context.watch<FoodDetailsCubit>().state.food;
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
      title: Text(
        food?.name ?? 'Loading...',
        style: const TextStyle(
          color: TextColors.primary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
