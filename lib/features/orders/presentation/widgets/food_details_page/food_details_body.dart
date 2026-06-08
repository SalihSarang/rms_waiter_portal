import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';
import '../food_details/food_image_header.dart';
import '../food_details/food_basic_info.dart';
import '../food_details/portion_selector.dart';
import '../food_details/add_ons_selector.dart';
import '../food_details/special_instructions_input.dart';

class FoodDetailsBody extends StatelessWidget {
  final FoodModel food;

  const FoodDetailsBody({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
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
  }
}
