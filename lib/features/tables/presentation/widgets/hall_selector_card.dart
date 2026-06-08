import 'package:flutter/material.dart';

import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:waiter_portal/features/orders/presentation/utils/table_utils.dart';
import 'tables_screen/components/hall_selector_card_content.dart';

class HallSelectorCard extends StatelessWidget {
  final HallModel hall;
  final VoidCallback onTap;

  const HallSelectorCard({super.key, required this.hall, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: TableUtils.getHallSelectorCardDecoration(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: HallSelectorCardContent(hall: hall),
      ),
    );
  }
}
