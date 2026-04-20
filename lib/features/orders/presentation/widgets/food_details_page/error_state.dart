import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/food_details/food_details_cubit.dart';

class ErrorView extends StatelessWidget {
  final String message;

  const ErrorView({super.key, required this.message});

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
              style: const TextStyle(color: TextColors.primary, fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () =>
                  context.read<FoodDetailsCubit>().fetchFoodDetails(),
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
