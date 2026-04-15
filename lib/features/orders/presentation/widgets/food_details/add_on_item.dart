import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class AddOnItem extends StatelessWidget {
  final AddOnsModel addOn;
  final bool isSelected;
  final VoidCallback onTap;

  const AddOnItem({
    super.key,
    required this.addOn,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.check_box_rounded
                  : Icons.check_box_outline_blank_rounded,
              color: isSelected ? SemanticColors.info : NeutralColors.icon,
              size: 20,
            ),
            const SizedBox(width: 12),
            Text(
              addOn.name,
              style: const TextStyle(color: NeutralColors.white, fontSize: 14),
            ),
            const Spacer(),
            Text(
              '+\$${addOn.price}',
              style: const TextStyle(color: NeutralColors.icon, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
