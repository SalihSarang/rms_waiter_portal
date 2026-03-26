import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A specialized view for displaying error states during hall layout loading,
/// providing feedback and a retry mechanism.
class TablesErrorView extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const TablesErrorView({
    super.key,
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      // CENTER: Main arrangement for error feedback
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ICON: Error visual indicator
            const Icon(
              Icons.error_outline_rounded,
              color: SemanticColors.error,
              size: 48,
            ),
            const SizedBox(height: 16),
            // TEXT: Descriptive error message
            Text(
              'Failed to load floor sections:\n$error',
              textAlign: TextAlign.center,
              style: const TextStyle(color: SemanticColors.error, fontSize: 16),
            ),
            const SizedBox(height: 24),
            // BUTTON: Retry action to attempt reload
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: PrimaryColors.defaultColor,
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
