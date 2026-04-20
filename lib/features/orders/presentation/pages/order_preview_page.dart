import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../bloc/cart/cart_bloc.dart';
import '../widgets/order_preview/order_preview_app_bar.dart';
import '../widgets/order_preview/order_preview_footer.dart';
import '../widgets/order_preview/order_preview_listener.dart';
import '../widgets/order_preview/order_preview_body.dart';

class OrderPreviewPage extends StatelessWidget {
  const OrderPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isEmpty = context.select((CartBloc bloc) => bloc.state.items.isEmpty);

    return OrderPreviewListener(
      child: Scaffold(
        backgroundColor: NeutralColors.background,
        appBar: const OrderPreviewAppBar(),
        body: OrderPreviewBody(isEmpty: isEmpty),
        bottomNavigationBar: isEmpty ? null : const OrderPreviewFooter(),
      ),
    );
  }
}
