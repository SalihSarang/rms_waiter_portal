import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/cart/cart_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/cart/cart_event.dart';
import 'package:waiter_portal/features/orders/presentation/pages/table_list_page.dart';

class AddOrderFab extends StatelessWidget {
  const AddOrderFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: PrimaryColors.defaultColor,
      shape: const CircleBorder(),
      child: const Icon(Icons.add, color: NeutralColors.white),
      onPressed: () {
        // Clear the cart before starting a new order flow
        context.read<CartBloc>().add(ClearCartEvent());

        Navigator.push(
          context,
          MaterialPageRoute(builder: (innerContext) => const TableListPage()),
        );
      },
    );
  }
}
