import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';

class LoginFooter extends StatelessWidget {
  final VoidCallback onContactManager;

  const LoginFooter({super.key, required this.onContactManager});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onContactManager,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.phone_outlined, color: TextColors.secondary, size: 16),
              SizedBox(width: 8),
              Text(
                'Contact Manager',
                style: TextStyle(color: TextColors.secondary, fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
