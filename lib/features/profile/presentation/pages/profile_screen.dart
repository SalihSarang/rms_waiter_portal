import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';
import 'package:waiter_portal/features/shift/presentation/widgets/shift_toggle_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeutralColors.background,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: TextColors.inverse),
        ),
        backgroundColor: NeutralColors.surface,
        iconTheme: const IconThemeData(color: TextColors.inverse),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const ShiftToggleButton(),
            const Spacer(),
            const Center(
              child: Text(
                'Profile Screen',
                style: TextStyle(
                  color: TextColors.inverse,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
