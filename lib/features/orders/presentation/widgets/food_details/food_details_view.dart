import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/food_details/food_details_cubit.dart';
import '../../bloc/food_details/food_details_state.dart';
import 'food_details_app_bar.dart';
import 'food_details_body.dart';

class FoodDetailsView extends StatelessWidget {
  const FoodDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodDetailsCubit, FoodDetailsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: NeutralColors.background,
          appBar: FoodDetailsAppBar(food: state.food),
          body: FoodDetailsBody(state: state),
        );
      },
    );
  }
}
