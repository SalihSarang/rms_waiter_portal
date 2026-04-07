import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:rms_design_system/rms_design_system.dart';

class AddMoreItemsButton extends StatelessWidget {
  final bool isLoading;

  const AddMoreItemsButton({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: isLoading ? null : () => Navigator.pop(context),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          side: const BorderSide(color: NeutralColors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            HugeIcon(
              icon: HugeIcons.strokeRoundedAdd01,
              color: NeutralColors.icon,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              'Add More Items',
              style: TextStyle(
                color: NeutralColors.icon,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
