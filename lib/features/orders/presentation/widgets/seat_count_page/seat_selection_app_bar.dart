import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// [SeatSelectionAppBar] is a custom AppBar used in the SeatCountPage.
///
/// It displays the table name and its capacity, along with a back button.
/// The background is transparent and the elevation is set to 0.
class SeatSelectionAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String tableName;
  final int capacity;

  const SeatSelectionAppBar({
    super.key,
    required this.tableName,
    required this.capacity,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: NeutralColors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const HugeIcon(
          icon: HugeIcons.strokeRoundedArrowLeft01,
          color: TextColors.primary,
          size: 24,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: NeutralColors.surface,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              tableName,
              style: const TextStyle(
                color: PrimaryColors.defaultColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '• Capacity:  $capacity seats',
            style: const TextStyle(color: NeutralColors.icon, fontSize: 14),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
