import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class HallLayoutErrorView extends StatelessWidget {
  final String error;

  const HallLayoutErrorView({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Failed to load tables:\n$error',
        textAlign: TextAlign.center,
        style: const TextStyle(color: SemanticColors.error),
      ),
    );
  }
}
