import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

export 'add_to_order_button.dart';

class QuantityActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const QuantityActionButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: NeutralColors.white, size: 20),
    );
  }
}
