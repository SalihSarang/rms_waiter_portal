import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Centralized UI utility methods for consistent user feedback across the application.
class UiUtils {
  /// Displays a standardized error snackbar using the design system.
  static void showErrorSnackbar(BuildContext context, String message) {
    RmsSnackbar.show(context, message: message, type: RmsSnackbarType.error);
  }
}
