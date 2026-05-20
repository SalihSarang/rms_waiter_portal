import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/orders/presentation/utils/table_utils.dart';

class PanZoomTag extends StatelessWidget {
  const PanZoomTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: TableUtils.getPanZoomTagDecoration(),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.pinch_rounded,
            size: 14,
            color: PrimaryColors.defaultColor,
          ),
          SizedBox(width: 6),
          Text(
            'Pan & Zoom',
            style: TextStyle(
              color: PrimaryColors.defaultColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
