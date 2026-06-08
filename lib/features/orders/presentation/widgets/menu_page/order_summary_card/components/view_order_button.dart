import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Builds the large primary action button.
class ViewOrderButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ViewOrderButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: PrimaryColors.defaultColor,
          foregroundColor: TextColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 8),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              color: TextColors.primary,
              size: 24,
            ),
            SizedBox(width: 12),
            Text(
              'VIEW ORDER',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
