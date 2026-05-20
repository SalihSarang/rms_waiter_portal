import 'package:flutter/material.dart';
import 'package:waiter_portal/core/widgets/rms_shimmer.dart';
import 'order_preview_empty_state.dart';
import 'order_preview_content.dart';

class OrderPreviewBody extends StatelessWidget {
  final bool isEmpty;

  const OrderPreviewBody({super.key, required this.isEmpty});

  @override
  Widget build(BuildContext context) {
    return ShimmerScope(
      child: isEmpty
          ? const OrderPreviewEmptyState()
          : const OrderPreviewContent(),
    );
  }
}
