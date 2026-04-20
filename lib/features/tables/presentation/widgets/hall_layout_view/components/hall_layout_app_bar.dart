import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class HallLayoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HallModel hall;

  const HallLayoutAppBar({super.key, required this.hall});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: NeutralColors.surface,
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded, color: TextColors.primary),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        hall.name,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 20,
          color: TextColors.primary,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: PrimaryColors.defaultColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: PrimaryColors.defaultColor.withValues(alpha: 0.3),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.pinch_rounded,
                size: 14,
                color: PrimaryColors.defaultColor,
              ),
              SizedBox(width: 6),
              Text(
                'Pan & Zoom',
                style: TextStyle(
                  color: PrimaryColors.defaultColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
