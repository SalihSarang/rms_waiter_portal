import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../utils/order_details_actions.dart';

class RequestBillButton extends StatelessWidget {
  final OrderModel order;

  const RequestBillButton({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
        onPressed: () =>
            OrderDetailsActions.showRequestBillConfirmation(context, order),
      ),
    );
  }
}
