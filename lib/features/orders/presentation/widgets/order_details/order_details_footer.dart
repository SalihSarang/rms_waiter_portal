import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class OrderDetailsFooter extends StatelessWidget {
  final OrderModel order;

  const OrderDetailsFooter({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    // Disable "Add More" if order is preparing or ready
    final bool canAddMore = order.orderStatus == OrderStatus.pending;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: NeutralColors.surface,
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: PrimaryColors.defaultColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.send_rounded, color: NeutralColors.white),
                    const SizedBox(width: 8),
                    const Text(
                      'Send to Kitchen',
                      style: TextStyle(
                        color: NeutralColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Quantity Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: NeutralColors.whiteAlpha20,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${order.orderedMenu.length}',
                        style: const TextStyle(
                          color: NeutralColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Bottom Action Row
            Row(
              children: [
                // Add More Button
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: canAddMore ? () {} : null,
                    icon: const Icon(Icons.add, size: 20),
                    label: const Text('Add More'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(
                        color: canAddMore
                            ? NeutralColors.border
                            : NeutralColors.border.withValues(alpha: 0.3),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      foregroundColor: canAddMore
                          ? NeutralColors.white
                          : NeutralColors.white.withValues(alpha: 0.3),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Request Bill Button
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const HugeIcon(
                      icon: HugeIcons.strokeRoundedInvoice02,
                      color: SemanticColors.info,
                      size: 20,
                    ),
                    label: const Text(
                      'Request Bill',
                      style: TextStyle(color: SemanticColors.info),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: SemanticColors.info),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
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
