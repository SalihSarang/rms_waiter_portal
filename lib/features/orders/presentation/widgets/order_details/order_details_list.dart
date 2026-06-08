import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'order_details_item_tile.dart';

class OrderDetailsList extends StatelessWidget {
  final List<CartItemModel> items;

  const OrderDetailsList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return OrderDetailsItemTile(item: items[index]);
      },
    );
  }
}
