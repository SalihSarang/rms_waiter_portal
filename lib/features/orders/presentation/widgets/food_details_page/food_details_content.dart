import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/food_details/food_details_cubit.dart';
import '../../bloc/food_details/food_details_state.dart';
import '../food_details/food_details_shimmer.dart';
import 'error_state.dart';
import 'food_empty_view.dart';
import 'food_details_body.dart';

class FoodDetailsContent extends StatelessWidget {
  const FoodDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodDetailsCubit, FoodDetailsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const FoodDetailsShimmer();
        }

        if (state.errorMessage != null) {
          return ErrorView(message: state.errorMessage!);
        }

        final food = state.food;
        if (food == null) {
          return const FoodEmptyView();
        }

        return FoodDetailsBody(food: food);
      },
    );
  }
}
