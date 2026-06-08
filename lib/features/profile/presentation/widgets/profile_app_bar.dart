import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A custom AppBar for the Profile screen.
/// Implements [PreferredSizeWidget] to be used in a [Scaffold].
class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const RmsAppBarTitle('Profile'),
      centerTitle: true,
      backgroundColor: NeutralColors.background,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
