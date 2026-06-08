import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'hall_layout_back_button.dart';
import 'pan_zoom_tag.dart';

class HallLayoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HallModel hall;

  const HallLayoutAppBar({super.key, required this.hall});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: NeutralColors.surface,
      elevation: 0,
      centerTitle: false,
      leading: const HallLayoutBackButton(),
      title: RmsAppBarTitle(hall.name),
      actions: const [PanZoomTag()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
