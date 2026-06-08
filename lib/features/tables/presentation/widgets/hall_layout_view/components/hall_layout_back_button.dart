import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class HallLayoutBackButton extends StatelessWidget {
  const HallLayoutBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_rounded, color: TextColors.primary),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
