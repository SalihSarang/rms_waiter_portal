import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class PortionErrorMessage extends StatelessWidget {
  const PortionErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: SemanticColors.warning.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: SemanticColors.warning.withValues(alpha: 0.5),
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: SemanticColors.warning,
            size: 20,
          ),
          SizedBox(width: 12),
          Text(
            'Please select a portion',
            style: TextStyle(
              color: SemanticColors.warning,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
