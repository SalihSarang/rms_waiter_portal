import 'package:flutter/material.dart';

/// Label for the logout button, optionally indicating that the shift will also be ended.
class ShiftLogoutLabel extends StatelessWidget {
  final bool isActive;

  const ShiftLogoutLabel({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.logout_rounded, size: 20),
        const SizedBox(width: 12),
        Text(
          isActive ? 'End Shift & Logout' : 'Logout',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
