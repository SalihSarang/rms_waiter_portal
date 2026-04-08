import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'order_preview_item_components.dart';
import 'order_quantity_controller.dart';

/// [OrderPreviewItemTile] displays a single item in the order preview list.
class OrderPreviewItemTile extends StatelessWidget {
  final CartItemModel item;

  const OrderPreviewItemTile({super.key, required this.item});

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
                OrderQuantityController(item: item),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
