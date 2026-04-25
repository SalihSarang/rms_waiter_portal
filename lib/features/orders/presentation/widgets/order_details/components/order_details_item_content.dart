import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../order_preview/order_preview_item_components/order_item_header.dart';
import '../../order_preview/order_preview_item_components/order_item_details.dart';
import '../../order_preview/order_preview_item_components/order_item_special_instructions.dart';

class OrderDetailsItemContent extends StatelessWidget {
  final CartItemModel item;

  const OrderDetailsItemContent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderItemHeader(
            name:
                '${item.name} x ${item.quantity} (${item.selectedPortion?.name ?? 'Standard'})',
            price: item.price * item.quantity,
          ),
          const SizedBox(height: 4),
          OrderItemDetails(addOns: item.selectedAddOns),
          OrderItemSpecialInstructions(
            instructions: item.specialInstructions,
          ),
        ],
      ),
    );
  }
}
