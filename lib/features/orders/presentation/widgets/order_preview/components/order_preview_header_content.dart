import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../../../../auth/presentation/bloc/auth_bloc/auth_state.dart';
import 'order_preview_summary_header.dart';
import 'order_preview_waiter_info.dart';

class OrderPreviewHeaderContent extends StatelessWidget {
  final String tableNumber;
  final String shortCode;

  const OrderPreviewHeaderContent({
    super.key,
    required this.tableNumber,
    required this.shortCode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final waiterName =
            authState is Authenticated ? authState.staff.name : 'Unknown';

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OrderPreviewSummaryHeader(tableNumber: tableNumber),
            OrderPreviewWaiterInfo(
              shortCode: shortCode,
              waiterName: waiterName,
            ),
          ],
        );
      },
    );
  }
}
