import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:waiter_portal/features/orders/presentation/widgets/order_preview/order_preview_item_components/order_item_details.dart';
import 'package:waiter_portal/features/orders/presentation/widgets/order_preview/order_preview_item_components/order_item_header.dart';
import 'package:waiter_portal/features/orders/presentation/widgets/order_preview/order_preview_item_components/order_item_image.dart';
import 'package:waiter_portal/features/orders/presentation/widgets/order_preview/order_preview_item_components/order_item_special_instructions.dart';
import 'order_quantity_controller.dart';

/// [OrderPreviewItemTile] displays a single item in the order preview list.
class OrderPreviewItemTile extends StatelessWidget {
  final CartItemModel item;
  final OrderStatus orderStatus;

  const OrderPreviewItemTile({
    super.key,
    required this.item,
    required this.orderStatus,
  });

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderItemHeader(name: item.name, price: item.price),
                const SizedBox(height: 4),
                OrderItemDetails(
                  portion: item.selectedPortion,
                  addOns: item.selectedAddOns,
                ),
                OrderItemSpecialInstructions(
                  instructions: item.specialInstructions,
                ),
                const SizedBox(height: 12),
                OrderQuantityController(item: item, orderStatus: orderStatus),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
