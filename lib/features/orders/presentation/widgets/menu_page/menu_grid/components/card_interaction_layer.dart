import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class CardInteractionLayer extends StatelessWidget {
  final bool isSoldOut;
  final VoidCallback? onTap;

  const CardInteractionLayer({
    super.key,
    required this.isSoldOut,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Material(
        color: NeutralColors.transparent,
        child: InkWell(
          onTap: isSoldOut ? null : onTap,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
