import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class HallSelectorLoadingView extends StatelessWidget {
  const HallSelectorLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 100),
      child: Center(
        child: CircularProgressIndicator(color: PrimaryColors.defaultColor),
      ),
    );
  }
}
