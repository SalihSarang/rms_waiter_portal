import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class SeatCountErrorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SeatCountErrorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: NeutralColors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: NeutralColors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text('Error', style: TextStyle(color: NeutralColors.white)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
