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
import 'food_details_shimmer.dart';

/// [FoodDetailsContent] manages the primary scrollable content area of the Food Details page.
/// It handles the Loading/Error/Loaded state branching internally to keep the main page declarative.
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
          return ErrorView(
            message: state.errorMessage!,
            onRetry: () => context.read<FoodDetailsCubit>().fetchFoodDetails(),
          );
        }

        final food = state.food;
        if (food == null) {
          return const Center(
            child: Text(
              'No food details available.',
              style: TextStyle(color: TextColors.primary),
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              FoodImageHeader(imageUrl: food.imageUrl),
              const SizedBox(height: 24),
              FoodBasicInfo(name: food.name, description: food.description),
              const SizedBox(height: 24),
              const PortionSelector(),
              const SizedBox(height: 24),
              const Divider(color: NeutralColors.border, height: 1),
              const SizedBox(height: 24),
              const AddOnsSelector(),
              const SizedBox(height: 24),
              const SpecialInstructionsInput(),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}
