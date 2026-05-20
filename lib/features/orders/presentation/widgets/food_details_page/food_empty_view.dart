import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class FoodEmptyView extends StatelessWidget {
  const FoodEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No food details available.',
        style: TextStyle(color: TextColors.primary),
      ),
    );
  }
}
