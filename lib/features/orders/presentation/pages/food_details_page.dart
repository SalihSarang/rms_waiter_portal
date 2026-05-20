import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
import 'package:waiter_portal/core/di/injector.dart';
import 'package:waiter_portal/features/orders/domain/repositories/food_repository.dart';
import '../bloc/food_details/food_details_cubit.dart';
import '../widgets/food_details/food_details_view.dart';
=======
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/core/di/injector.dart';
import 'package:waiter_portal/features/orders/domain/repositories/food_repository.dart';
import '../bloc/food_details/food_details_cubit.dart';
import '../bloc/food_details/food_details_state.dart';
import '../widgets/food_details/food_image_header.dart';
import '../widgets/food_details/food_basic_info.dart';
import '../widgets/food_details/portion_selector.dart';
import '../widgets/food_details/add_ons_selector.dart';
import '../widgets/food_details/special_instructions_input.dart';
import '../widgets/food_details/bottom_action_bar.dart';
import '../widgets/food_details/food_details_app_bar.dart';
import '../widgets/food_details/food_details_shimmer.dart';
>>>>>>> origin/main

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
<<<<<<< HEAD
=======

class FoodDetailsView extends StatelessWidget {
  const FoodDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodDetailsCubit, FoodDetailsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: NeutralColors.background,
          appBar: FoodDetailsAppBar(food: state.food),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, FoodDetailsState state) {
    if (state.isLoading) {
      return const FoodDetailsShimmer();
    }

    if (state.errorMessage != null) {
      return _ErrorView(
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

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: SemanticColors.error,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: NeutralColors.white, fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: SemanticColors.info,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
>>>>>>> origin/main
