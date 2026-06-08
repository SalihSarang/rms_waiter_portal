import 'package:flutter/material.dart';
import 'components/tables_error_view_content.dart';

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
        child: TablesErrorViewContent(error: error, onRetry: onRetry),
      ),
    );
  }
}
