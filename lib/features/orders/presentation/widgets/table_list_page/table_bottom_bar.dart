import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class TableBottomBar extends StatelessWidget {
  const TableBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: NeutralColors.background,
        border: Border(top: BorderSide(color: NeutralColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: 54,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: PrimaryColors.defaultColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: NeutralColors.white),
                SizedBox(width: 8),
                Text(
                  'Create Order',
                  style: TextStyle(
                    color: NeutralColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
