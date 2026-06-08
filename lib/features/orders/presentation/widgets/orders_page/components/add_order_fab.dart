import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc/auth_state.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/cart/cart_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/cart/cart_event.dart';
import 'package:waiter_portal/features/orders/presentation/pages/table_list_page.dart';
import 'package:waiter_portal/features/shift/presentation/bloc/shift_bloc.dart';
import 'package:waiter_portal/features/shift/presentation/bloc/shift_event.dart';
import 'package:waiter_portal/features/shift/presentation/bloc/shift_state.dart';

class AddOrderFab extends StatelessWidget {
  const AddOrderFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: PrimaryColors.defaultColor,
      shape: const CircleBorder(),
      child: const Icon(Icons.add, color: TextColors.primary),
      onPressed: () {
        final authState = context.read<AuthBloc>().state;
        if (authState is! Authenticated) return;
        final staff = authState.staff;

        final shiftState = context.read<ShiftBloc>().state;
        bool isShiftStarted = false;

        if (shiftState is ShiftReady) {
          isShiftStarted = shiftState.status == ShiftStatus.active;
        }

        if (!isShiftStarted) {
          RmsAlertDialog.show(
            context,
            title: 'Shift Inactive',
            message: 'Please start your shift to create orders.',
            type: RmsAlertDialogType.confirm,
            onConfirm: () {
              context.read<ShiftBloc>().add(StartShiftEvent(staff));
              context.read<CartBloc>().add(ClearCartEvent());
              Navigator.push(
                context,
                MaterialPageRoute(builder: (innerContext) => const TableListPage()),
              );
            },
          );
        } else {
          context.read<CartBloc>().add(ClearCartEvent());
          Navigator.push(
            context,
            MaterialPageRoute(builder: (innerContext) => const TableListPage()),
          );
        }
      },
    );
  }
}
