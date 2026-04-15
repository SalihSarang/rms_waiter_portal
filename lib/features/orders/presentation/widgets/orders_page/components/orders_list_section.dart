import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/order_filter/order_filter_cubit.dart';
import 'package:waiter_portal/features/orders/presentation/pages/view_all_order_page.dart';
import 'package:waiter_portal/features/orders/presentation/widgets/orders_page/components/orders_list_view.dart';
import '../../../../domain/enums/order_filter.dart';

class OrdersListSection extends StatelessWidget {
  final bool showViewAll;

  const OrdersListSection({super.key, this.showViewAll = true});

  @override
  Widget build(BuildContext context) {
    final selectedFilter = context.select(
      (OrderFilterCubit cubit) => cubit.state.selectedFilter,
    );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedFilter == OrderFilter.all
                    ? 'Active Orders'
                    : selectedFilter.displayName,
                style: const TextStyle(
                  color: NeutralColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (showViewAll)
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewAllOrderPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'View All Order',
                    style: TextStyle(
                      color: PrimaryColors.defaultColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
        ),
        OrdersListView(
          selectedFilter: selectedFilter,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}
