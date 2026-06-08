import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Displays the descriptive error message for table loading failures.
class TablesErrorMessage extends StatelessWidget {
  final String error;

  const TablesErrorMessage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        // TEXT: Descriptive error message
        Text(
          'Failed to load floor sections:\n$error',
          textAlign: TextAlign.center,
          style: const TextStyle(color: SemanticColors.error, fontSize: 16),
        ),
      ],
    );
  }
}
