import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../order_preview/order_preview_item_components.dart';

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderItemHeader(
                  name: item.name,
                  price: item.price * item.quantity,
                ),
                const SizedBox(height: 4),
                OrderItemDetails(
                  portion: item.selectedPortion,
                  addOns: item.selectedAddOns,
                ),
                if (item.quantity > 1)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'Quantity: ${item.quantity}',
                      style: const TextStyle(
                        color: NeutralColors.icon,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                OrderItemSpecialInstructions(
                  instructions: item.specialInstructions,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
