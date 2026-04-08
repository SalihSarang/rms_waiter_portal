import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../widgets/order_preview/order_preview_app_bar.dart';
import '../widgets/order_preview/order_preview_body.dart';
import '../widgets/order_preview/order_preview_listener.dart';
import 'package:waiter_portal/core/widgets/rms_shimmer.dart';

/// [OrderPreviewPage] is a final review screen for the waiter before placing an order.
/// It displays all items in the cart, allows quantity adjustments, and handles the
/// final submission to Firestore.
class OrderPreviewPage extends StatelessWidget {
  const OrderPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrderPreviewListener(
      child: Scaffold(
        backgroundColor: NeutralColors.background,
        appBar: const OrderPreviewAppBar(),
        body: const ShimmerScope(child: OrderPreviewBody()),
      ),
    );
  }
}
