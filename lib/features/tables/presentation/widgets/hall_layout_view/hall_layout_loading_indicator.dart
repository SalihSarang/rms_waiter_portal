import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class HallLayoutLoadingIndicator extends StatelessWidget {
  const HallLayoutLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 16,
      right: 16,
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: PrimaryColors.defaultColor,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
