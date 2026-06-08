import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:waiter_portal/features/orders/presentation/widgets/order_preview/order_preview_item_components/order_item_image.dart';
import 'components/order_details_item_content.dart';

class OrderDetailsItemTile extends StatelessWidget {
  final CartItemModel item;

  const OrderDetailsItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: NeutralColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderItemImage(imageUrl: item.imageUrl),
          const SizedBox(width: 16),
          OrderDetailsItemContent(item: item),
        ],
      ),
    );
  }
}
