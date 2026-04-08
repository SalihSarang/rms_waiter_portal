import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'bottom_action_widgets.dart';
import 'food_details_actions.dart';

class BottomActionBar extends StatelessWidget {
  final int quantity;
  final bool hasSelectedPortion;

  const BottomActionBar({
    super.key,
    required this.quantity,
    required this.hasSelectedPortion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: NeutralColors.background,
        border: Border(top: BorderSide(color: NeutralColors.border, width: 1)),
      ),
      child: Row(
        children: [
          QuantitySelector(
            quantity: quantity,
            hasSelectedPortion: hasSelectedPortion,
          ),
          const SizedBox(width: 16),
          AddToOrderButton(hasSelectedPortion: hasSelectedPortion),
        ],
      ),
    );
  }
}
