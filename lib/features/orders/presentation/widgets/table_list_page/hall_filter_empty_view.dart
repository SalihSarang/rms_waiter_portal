import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class HallFilterEmptyView extends StatelessWidget {
  const HallFilterEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        'No halls available',
        style: TextStyle(color: NeutralColors.icon),
      ),
    );
  }
}
