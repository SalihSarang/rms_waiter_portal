import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class ViewAllOrdersAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ViewAllOrdersAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: NeutralColors.surface,
      elevation: 0,
      title: const Text(
        'All Orders',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 22,
          color: NeutralColors.white,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: NeutralColors.white),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
