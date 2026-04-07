import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class TaxBadge extends StatelessWidget {
  const TaxBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: NeutralColors.border,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        '8%',
        style: TextStyle(color: NeutralColors.icon, fontSize: 10),
      ),
    );
  }
}
