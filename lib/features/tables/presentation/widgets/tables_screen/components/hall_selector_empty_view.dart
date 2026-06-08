import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class HallSelectorEmptyView extends StatelessWidget {
  const HallSelectorEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 100),
      child: Center(
        child: Text(
          'No floor sections available.\nManagers need to create them first.',
          textAlign: TextAlign.center,
          style: TextStyle(color: NeutralColors.icon, fontSize: 16),
        ),
      ),
    );
  }
}
