import 'package:flutter/material.dart';

/// Label for the main shift action button, toggling between Start and End shift.
class ShiftActionLabel extends StatelessWidget {
  final bool isActive;

  const ShiftActionLabel({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(isActive ? Icons.logout_rounded : Icons.login_rounded, size: 20),
        const SizedBox(width: 12),
        Text(
          isActive ? 'End Shift' : 'Start Shift',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
