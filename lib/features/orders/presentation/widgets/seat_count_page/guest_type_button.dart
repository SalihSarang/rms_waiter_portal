import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// [GuestTypeButton] is a UI component used to display a selectable guest type.
///
/// It is a simple [OutlinedButton] that triggers an [onTap] callback when pressed.
class GuestTypeButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const GuestTypeButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: NeutralColors.border),
            backgroundColor: NeutralColors.gradientStart,
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(color: TextColors.primary, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
