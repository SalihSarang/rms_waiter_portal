import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../utils/order_details_actions.dart';

class CancelOrderButton extends StatelessWidget {
  final OrderModel order;

  const CancelOrderButton({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: SizedBox(
        width: double.infinity,
        child: RmsButton(
          text: 'Cancel Order',
          isOutlined: true,
          textColor: SemanticColors.error,
          borderColor: SemanticColors.error,
          onPressed: () =>
              OrderDetailsActions.showCancelConfirmation(context, order),
        ),
      ),
    );
  }
}
