import 'package:flutter/material.dart';
import 'package:rms_design_system/widgets/rms_alert_dialog.dart';

/// Displays a standardized confirmation dialog using the RMS design system.
///
/// This replaces the manual [AlertDialog] implementation to ensure a premium,
/// consistent look and feel across the application.
void showOrderConfirmationDialog(
  BuildContext context, {
  required String title,
  required String message,
  required VoidCallback onConfirm,
}) {
  RmsAlertDialog.show(
    context,
    title: title,
    message: message,
    type: RmsAlertDialogType.confirm,
    onConfirm: onConfirm,
  );
}
