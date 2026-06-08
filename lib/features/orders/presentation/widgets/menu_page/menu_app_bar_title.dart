import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class MenuAppBarTitle extends StatelessWidget {
  final String tableNumber;

  const MenuAppBarTitle({super.key, required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'New Order',
          style: TextStyle(
            color: TextColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'TABLE $tableNumber',
          style: TextStyle(
            color: TextColors.primary.withValues(alpha: 0.5),
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
