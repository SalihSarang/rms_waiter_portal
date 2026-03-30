import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class OrderActionButtons extends StatelessWidget {
  final OrderStatus status;

  const OrderActionButtons({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    if (status == OrderStatus.pending) {
      return const Row(
        children: [
          Expanded(
            child: OrderActionButton(
              text: 'View Details',
              bgColor: NeutralColors.card,
              textColor: NeutralColors.white,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: OrderActionButton(
              text: 'Accept Order',
              bgColor: StatusColors.pending,
              textColor: NeutralColors.background,
            ),
          ),
        ],
      );
    } else if (status == OrderStatus.preparing) {
      return const Row(
        children: [
          Expanded(
            child: OrderActionButton(
              text: 'View Details',
              bgColor: NeutralColors.card,
              textColor: NeutralColors.white,
            ),
          ),
        ],
      );
    } else {
      // Ready
      return const Row(
        children: [
          Expanded(
            child: OrderActionButton(
              text: 'View Details',
              bgColor: NeutralColors.card,
              textColor: NeutralColors.white,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: OrderActionButton(
              text: 'Serve Now',
              bgColor: StatusColors.ready,
              textColor: NeutralColors.white,
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

  const OrderActionButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
