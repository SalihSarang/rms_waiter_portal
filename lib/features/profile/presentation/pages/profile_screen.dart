import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import '../widgets/profile_body/profile_body.dart';
import '../widgets/profile_app_bar.dart';

/// The main entry point for the Profile feature.
/// Handles the basic navigation structure (Scaffold/AppBar) and delegates
/// content assembly to internal widgets.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeutralColors.background,
      appBar: const ProfileAppBar(),
      body: const ProfileBody(),
    );
  }
}
