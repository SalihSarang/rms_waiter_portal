import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/order_filter/order_filter_cubit.dart';
import '../../../../domain/enums/order_filter.dart';

class OrderFilterRow extends StatelessWidget {
  const OrderFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedFilter = context.select(
      (OrderFilterCubit cubit) => cubit.state.selectedFilter,
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: OrderFilter.values.map((filter) {
          final isSelected = selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(filter.displayName),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  context.read<OrderFilterCubit>().setFilter(filter);
                }
              },
              backgroundColor: NeutralColors.surface,
              selectedColor: PrimaryColors.defaultColor,
              labelStyle: TextStyle(
                color: isSelected ? TextColors.primary : NeutralColors.icon,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected
                      ? PrimaryColors.defaultColor
                      : NeutralColors.border,
                ),
              ),
              showCheckmark: false,
            ),
          );
        }).toList(),
      ),
    );
  }
}
