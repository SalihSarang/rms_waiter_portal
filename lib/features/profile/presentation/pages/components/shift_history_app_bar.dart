import 'package:flutter/material.dart';

/// Standard AppBar for the Shift History screen.
class ShiftHistoryAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ShiftHistoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Shift History',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
