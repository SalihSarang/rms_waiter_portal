import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A standard loading indicator used within shift action buttons.
class ShiftLoadingIndicator extends StatelessWidget {
  const ShiftLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(TextColors.primary),
      ),
    );
  }
}
