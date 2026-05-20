import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class TablesScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const TablesScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: NeutralColors.surface,
      elevation: 0,
      title: const Text(
        'Floor Sections',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 22,
          color: TextColors.primary,
        ),
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
