import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../../bloc/order/order_bloc.dart';
import '../../../bloc/order/order_event.dart';
import '../../../bloc/order/order_state.dart';

class SendToKitchenButton extends StatelessWidget {
  final OrderModel order;
  final bool hasNewItems;
  final bool canSendToKitchen;

  const SendToKitchenButton({
    super.key,
    required this.order,
    required this.hasNewItems,
    required this.canSendToKitchen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          final isLoading = state is OrderLoading;
          return RmsButton(
            text: isLoading
                ? 'Sending...'
                : (hasNewItems ? 'Send to Kitchen' : 'Sent to Kitchen'),
            icon: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: TextColors.primary,
                    ),
                  )
                : Icon(
                    hasNewItems
                        ? Icons.send_rounded
                        : Icons.check_circle_outline,
                    color: TextColors.primary,
                    size: 20,
                  ),
            onPressed: canSendToKitchen && !isLoading
                ? () {
                    context.read<OrderBloc>().add(SendToKitchen(order));
                  }
                : null,
          );
        },
      ),
    );
  }
}
