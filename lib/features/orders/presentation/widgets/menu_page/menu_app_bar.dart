import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// [MenuAppBar] is a custom header widget for the Menu screen.
///
/// It provides:
/// 1. A back button to return to the table selection screen.
/// 2. A title ("New Order") to indicate the current action.
/// 3. A table subtitle (e.g., "TABLE 12") to maintain context for the waiter.
///
/// We use a custom [Container] instead of a standard [AppBar] to have
/// finer control over the internal spacing and the background color.
///
class MenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String tableNumber;

  const MenuAppBar({super.key, required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: NeutralColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // BACK BUTTON: Standard iOS-style arrow for navigation.
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: TextColors.primary,
                size: 18,
              ),
            ),
            // TITLE SECTION: Centered info about the current order context.
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'New Order',
                  style: TextStyle(
                    color: TextColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'TABLE $tableNumber',
                  style: TextStyle(
                    color: TextColors.primary.withValues(alpha: 0.5),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            // Empty sized box to keep title mathematically centered since we removed the QR scanner.
            const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
