import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../widgets/order_details/order_details_app_bar.dart';
import '../widgets/order_details/order_details_footer.dart';
import '../widgets/order_details/order_details_view.dart';

class OrderDetailsPage extends StatelessWidget {
  final OrderModel order;

  const OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeutralColors.background,
      appBar: OrderDetailsAppBar(order: order),
      body: OrderDetailsView(order: order),
      bottomNavigationBar:
          (order.orderStatus == OrderStatus.pending ||
              order.orderStatus == OrderStatus.served)
          ? OrderDetailsFooter(order: order)
          : null,
    );
  }
}
