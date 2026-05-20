import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

import 'package:hugeicons/hugeicons.dart';

/// [OrderPreviewEmptyState] displays a message to the user when the order is empty.
class OrderPreviewEmptyState extends StatelessWidget {
  const OrderPreviewEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: NeutralColors.surface,
              shape: BoxShape.circle,
              border: Border.all(color: NeutralColors.border),
            ),
            child: const HugeIcon(
              icon: HugeIcons.strokeRoundedShoppingCart01,
              color: NeutralColors.icon,
              size: 48,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Your cart is empty',
            style: TextStyle(
              color: TextColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Looks like you haven't added anything yet.",
            style: TextStyle(color: NeutralColors.icon, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
