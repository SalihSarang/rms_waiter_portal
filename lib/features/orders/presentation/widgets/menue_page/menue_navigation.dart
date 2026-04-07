import 'package:flutter/material.dart';
import '../../pages/order_preview_page.dart';

/// [MenueNavigation] provides reusable navigation logic for the menu screen.
mixin MenueNavigation {
  void navigateToPreview(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (innerContext) => const OrderPreviewPage()),
    );
  }
}
