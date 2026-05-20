import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/core/di/injector.dart';
import 'package:waiter_portal/features/orders/domain/repositories/food_repository.dart';
import 'package:waiter_portal/features/orders/presentation/widgets/food_details_page/food_details_content.dart';
import '../bloc/food_details/food_details_cubit.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../widgets/food_details/food_details_app_bar.dart';
import '../widgets/food_details/bottom_action_bar.dart';

class FoodDetailsPage extends StatelessWidget {
  final String foodId;

  const FoodDetailsPage({super.key, required this.foodId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodDetailsCubit(getIt<FoodRepository>(), foodId),
      child: Scaffold(
        backgroundColor: NeutralColors.background,
        appBar: const FoodDetailsAppBar(),
        body: const FoodDetailsContent(),
        bottomNavigationBar: const BottomActionBar(),
      ),
    );
  }
}
