import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class SummaryDivider extends StatelessWidget {
  const SummaryDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Divider(color: NeutralColors.border, height: 1),
    );
  }
}
