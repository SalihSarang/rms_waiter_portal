import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class PortionRadioIndicator extends StatelessWidget {
  final bool isSelected;

  const PortionRadioIndicator({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? SemanticColors.info : NeutralColors.icon,
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: SemanticColors.info,
                ),
              ),
            )
          : null,
    );
  }
}
