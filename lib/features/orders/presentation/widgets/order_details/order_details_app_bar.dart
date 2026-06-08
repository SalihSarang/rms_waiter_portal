import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'components/order_details_info_column.dart';

class OrderDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final OrderModel order;

  const OrderDetailsAppBar({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
        bottom: 20,
        left: 20,
        right: 20,
      ),
      decoration: const BoxDecoration(
        color: NeutralColors.surface,
        border: Border(
          bottom: BorderSide(color: NeutralColors.border, width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back Button
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: TextColors.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 20),
          // Metadata Column
          OrderDetailsInfoColumn(order: order),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
