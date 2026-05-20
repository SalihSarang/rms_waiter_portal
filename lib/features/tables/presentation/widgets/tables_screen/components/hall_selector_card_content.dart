import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'hall_selector_card_header.dart';
import 'hall_selector_card_info.dart';

class HallSelectorCardContent extends StatelessWidget {
  final HallModel hall;

  const HallSelectorCardContent({super.key, required this.hall});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const HallSelectorCardHeader(),
        const SizedBox(height: 8),
        HallSelectorCardInfo(hall: hall),
      ],
    );
  }
}
