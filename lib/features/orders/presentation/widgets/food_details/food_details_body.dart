import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/food_details/food_details_cubit.dart';
import '../../bloc/food_details/food_details_state.dart';
import '../food_details_page/error_state.dart';
import 'food_image_header.dart';
import 'food_basic_info.dart';
import 'portion_selector.dart';
import 'add_ons_selector.dart';
import 'special_instructions_input.dart';
import 'bottom_action_bar.dart';
import 'food_details_shimmer.dart';

class FoodDetailsBody extends StatelessWidget {
  final FoodDetailsState state;

  const FoodDetailsBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const FoodDetailsShimmer();
    }

    if (state.errorMessage != null) {
      return ErrorView(
        message: state.errorMessage!,
        onRetry: () => context.read<FoodDetailsCubit>().fetchFoodDetails(),
      );
    }

    if (state.food == null) {
      return const Center(
        child: Text(
          'No food details available.',
          style: TextStyle(color: NeutralColors.white),
        ),
      );
    }

    final food = state.food!;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                FoodImageHeader(imageUrl: food.imageUrl),
                const SizedBox(height: 24),
                FoodBasicInfo(name: food.name, description: food.description),
                const SizedBox(height: 24),
                PortionSelector(
                  portions: food.portions,
                  selectedPortion: state.selectedPortion,
                  showError: state.showPortionError,
                ),
                const SizedBox(height: 24),
                const Divider(color: NeutralColors.border, height: 1),
                const SizedBox(height: 24),
                AddOnsSelector(
                  addOns: food.addOns,
                  selectedAddOns: state.selectedAddOns,
                ),
                const SizedBox(height: 24),
                SpecialInstructionsInput(
                  initialValue: state.specialInstructions,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
        BottomActionBar(
          quantity: state.quantity,
          hasSelectedPortion: state.selectedPortion != null,
        ),
      ],
    );
  }
}
