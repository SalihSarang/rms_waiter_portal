import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/core/widgets/rms_shimmer.dart';
import '../bloc/cart/cart_bloc.dart';
import '../widgets/order_preview/order_preview_app_bar.dart';
import '../widgets/order_preview/order_preview_empty_state.dart';
import '../widgets/order_preview/order_preview_footer.dart';
import '../widgets/order_preview/order_preview_items_section.dart';
import '../widgets/order_preview/order_preview_listener.dart';

/// [OrderPreviewPage] is a final review screen for the waiter before placing an order.
/// It displays all items in the cart, allows quantity adjustments, and handles the
/// final submission to Firestore.
class OrderPreviewPage extends StatelessWidget {
  const OrderPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isEmpty = context.select((CartBloc bloc) => bloc.state.items.isEmpty);

    return OrderPreviewListener(
      child: Scaffold(
        backgroundColor: NeutralColors.background,
        appBar: const OrderPreviewAppBar(),
        body: ShimmerScope(
          child: isEmpty
              ? const OrderPreviewEmptyState()
              : const Column(
                  children: [
                    Expanded(child: OrderPreviewItemsSection()),
                    OrderPreviewFooter(),
                  ],
                ),
        ),
      ),
    );
  }
}
