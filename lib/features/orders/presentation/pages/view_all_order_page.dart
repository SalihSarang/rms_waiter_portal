import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/order_filter/order_filter_cubit.dart';
import '../widgets/orders_page/components/orders_list_section.dart';
import '../widgets/orders_page_body/components/order_filter_row.dart';
import '../widgets/view_all_order/components/view_all_orders_app_bar.dart';

class ViewAllOrderPage extends StatelessWidget {
  const ViewAllOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderFilterCubit(),
      child: const Scaffold(
        backgroundColor: NeutralColors.background,
        appBar: ViewAllOrdersAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [OrderFilterRow(), OrdersListSection(showViewAll: false)],
          ),
        ),
      ),
    );
  }
}
