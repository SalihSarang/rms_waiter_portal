import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class OrderLoadingIndicator extends StatelessWidget {
  const OrderLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        color: TextColors.primary,
        strokeWidth: 2,
      ),
    );
  }
}
