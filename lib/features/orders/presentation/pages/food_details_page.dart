import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/core/di/injector.dart';
import 'package:waiter_portal/features/orders/domain/repositories/food_repository.dart';
import '../bloc/food_details/food_details_cubit.dart';
import '../widgets/food_details/food_details_view.dart';

class FoodDetailsPage extends StatelessWidget {
  final String foodId;

  const FoodDetailsPage({super.key, required this.foodId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodDetailsCubit(getIt<FoodRepository>(), foodId),
      child: const FoodDetailsView(),
    );
  }
}
