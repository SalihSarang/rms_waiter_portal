import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

import '../../../../pages/order_details_page.dart';

class OrderActionButtons extends StatelessWidget {
  final OrderModel order;

  const OrderActionButtons({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final status = order.orderStatus;
    if (status == OrderStatus.pending) {
      return Row(
        children: [
          Expanded(
            child: OrderActionButton(
              text: 'View Details',
              bgColor: NeutralColors.card,
              textColor: NeutralColors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailsPage(order: order),
                  ),
                );
              },
            ),
          ),
        ],
      );
    } else if (status == OrderStatus.preparing) {
      return Row(
        children: [
          Expanded(
            child: OrderActionButton(
              text: 'View Details',
              bgColor: NeutralColors.card,
              textColor: NeutralColors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailsPage(order: order),
                  ),
                );
              },
            ),
          ),
        ],
      );
    } else {
      // Ready
      return Row(
        children: [
          Expanded(
            child: OrderActionButton(
              text: 'View Details',
              bgColor: NeutralColors.card,
              textColor: NeutralColors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailsPage(order: order),
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: OrderActionButton(
              text: 'Serve Now',
              bgColor: StatusColors.ready,
              textColor: NeutralColors.white,
              onPressed: () {
                // TODO: Implement serve now logic
              },
            ),
          ),
        ],
      );
    }
  }
}

class OrderActionButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final VoidCallback onPressed;

  const OrderActionButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        elevation: 0,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
