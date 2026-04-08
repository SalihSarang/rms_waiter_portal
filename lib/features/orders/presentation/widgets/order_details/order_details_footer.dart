import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class OrderDetailsFooter extends StatelessWidget {
  final OrderModel order;

  const OrderDetailsFooter({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    // Both buttons disabled if order status is preparing
    final bool isPreparing = order.orderStatus == OrderStatus.preparing;

    // Send to Kitchen logic: only show when there are new/unsent items
    final bool hasNewItems = order.orderedMenu.any(
      (item) => !item.isSentToKitchen,
    );
    final bool showSendToKitchen = hasNewItems;
    final bool canSendToKitchen = !isPreparing && hasNewItems;

    // Add More logic: disabled if preparing
    final bool canAddMore = !isPreparing;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: NeutralColors.appBarBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: NeutralColors.shadowLight,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Send to Kitchen Button
            if (showSendToKitchen)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: RmsButton(
                  text: 'Send to Kitchen',
                  icon: const Icon(
                    Icons.send_rounded,
                    color: NeutralColors.white,
                    size: 20,
                  ),
                  onPressed: canSendToKitchen ? () {} : null,
                ),
              ),

            // Bottom Action Row
            Row(
              children: [
                // Add More Button
                Expanded(
                  child: RmsButton(
                    text: 'Add More',
                    icon: Icon(
                      Icons.add,
                      size: 20,
                      color: canAddMore
                          ? NeutralColors.white
                          : NeutralColors.white.withValues(alpha: 0.3),
                    ),
                    isOutlined: true,
                    onPressed: canAddMore ? () {} : null,
                  ),
                ),
                const SizedBox(width: 12),
                // Request Bill Button
                Expanded(
                  child: RmsButton(
                    text: 'Request Bill',
                    icon: const HugeIcon(
                      icon: HugeIcons.strokeRoundedInvoice02,
                      color: StatusColors.purpleLight,
                      size: 20,
                    ),
                    isOutlined: true,
                    textColor: StatusColors.purpleLight,
                    borderColor: StatusColors.purpleLight,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
