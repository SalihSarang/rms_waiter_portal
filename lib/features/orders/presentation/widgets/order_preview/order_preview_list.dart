import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'order_preview_item_tile.dart';

/// [OrderPreviewList] handles the display of a list of cart items.
class OrderPreviewList extends StatelessWidget {
  final List<CartItemModel> items;
  final OrderStatus orderStatus;

  const OrderPreviewList({
    super.key,
    required this.items,
    required this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final item = items[index];
        return OrderPreviewItemTile(item: item, orderStatus: orderStatus);
      },
    );
  }
}
