import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'hall_selector_card_icon.dart';

class HallSelectorCardHeader extends StatelessWidget {
  const HallSelectorCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        HallSelectorCardIcon(),
        Spacer(),
        Icon(
          Icons.chevron_right_rounded,
          color: NeutralColors.icon,
          size: 20,
        ),
      ],
    );
  }
}
