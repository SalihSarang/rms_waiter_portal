import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/order/order_bloc.dart';
import '../../bloc/order/order_state.dart';
import 'components/order_preview_header_content.dart';

/// [OrderPreviewAppBar] is a stylized AppBar for the order preview screen.
class OrderPreviewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const OrderPreviewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: NeutralColors.background,
      elevation: 0,
      leading: IconButton(
        icon: const HugeIcon(
          icon: HugeIcons.strokeRoundedArrowLeft01,
          color: NeutralColors.icon,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      titleSpacing: 0,
      title: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, orderState) {
          final order = orderState is OrderInProgress ? orderState.order : null;
          final tableNumber = order?.tableNumber ?? '--';
          final orderId = order?.id ?? 'PENDING';
          // Use last 4 digits for a cleaner display code
          final shortCode = orderId.length > 4
              ? orderId.substring(orderId.length - 4)
              : orderId;

          return OrderPreviewHeaderContent(
            tableNumber: tableNumber,
            shortCode: shortCode,
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
