import 'package:flutter/material.dart';
import '../../pages/order_preview_page.dart';

/// [MenuNavigation] provides reusable navigation logic for the menu screen.
mixin MenuNavigation {
  void navigateToPreview(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (innerContext) => const OrderPreviewPage()),
    );
  }
}
