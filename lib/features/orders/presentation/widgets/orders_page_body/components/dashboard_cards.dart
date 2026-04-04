import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'dashboard_card.dart';

class DashboardCards extends StatelessWidget {
  const DashboardCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          child: DashboardCard(
            title: 'ORDER SERVED',
            value: '4',
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedWaiter,
              color: PrimaryColors.defaultColor,
              size: 24,
            ),
          ),
        ),
        const SizedBox(width: 5),
        const Expanded(
          child: DashboardCard(
            title: 'EARNINGS',
            value: '₹4,250',
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedCash01,
              color: PrimaryColors.brandGreen,
              size: 24,
            ),
          ),
        ),
        const SizedBox(width: 5),
        const Expanded(
          child: DashboardCard(
            title: 'PENDING ORDERS',
            value: '4',
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedInvoice01,
              color: PrimaryColors.defaultColor,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}
