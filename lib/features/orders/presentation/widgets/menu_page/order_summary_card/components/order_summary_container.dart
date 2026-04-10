import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Provides the premium background decoration and padding for the order summary card.
class OrderSummaryContainer extends StatelessWidget {
  final Widget child;

  const OrderSummaryContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: NeutralColors.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          // Using withValues for modern Flutter color manipulation.
          color: NeutralColors.border.withValues(alpha: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: NeutralColors.blackAlpha40,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            NeutralColors.cardGradientStart,
            NeutralColors.cardGradientEnd,
          ],
        ),
      ),
      child: child,
    );
  }
}
