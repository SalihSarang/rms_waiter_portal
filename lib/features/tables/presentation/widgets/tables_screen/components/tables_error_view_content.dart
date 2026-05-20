import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'tables_error_message.dart';
import 'tables_retry_button.dart';

/// The central content area for the tables error view, combining visual feedback
/// and action elements.
class TablesErrorViewContent extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const TablesErrorViewContent({
    super.key,
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ICON: Error visual indicator
        const Icon(
          Icons.error_outline_rounded,
          color: SemanticColors.error,
          size: 48,
        ),

        TablesErrorMessage(error: error),

        TablesRetryButton(onRetry: onRetry),
      ],
    );
  }
}
