import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import '../widgets/profile_body.dart';

/// The main entry point for the Profile feature.
/// Handles the basic navigation structure (Scaffold/AppBar) and delegates
/// content assembly to internal widgets.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeutralColors.background,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: NeutralColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: NeutralColors.background,
        elevation: 0,
      ),
      body: const ProfileBody(),
    );
  }
}
