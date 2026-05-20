import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Provides a retry action button to attempt reloading the table data.
class TablesRetryButton extends StatelessWidget {
  final VoidCallback onRetry;

  const TablesRetryButton({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        // BUTTON: Retry action using the design system component
        RmsButton(
          text: 'Retry',
          onPressed: onRetry,
        ),
      ],
    );
  }
}
