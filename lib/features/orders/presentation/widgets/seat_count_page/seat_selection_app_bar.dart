import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class SeatSelectionAppBar extends StatelessWidget implements PreferredSizeWidget {
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
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const HugeIcon(
          icon: HugeIcons.strokeRoundedArrowLeft01,
          color: Colors.white,
          size: 24,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF16202D),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              tableName,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '• Capacity:  $capacity seats',
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
