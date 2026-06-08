import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class HallSelectorCardInfo extends StatelessWidget {
  final HallModel hall;

  const HallSelectorCardInfo({super.key, required this.hall});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hall.name,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: TextColors.primary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        const Text(
          'Tap to view layout',
          style: TextStyle(fontSize: 11, color: NeutralColors.icon),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
