import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'profile_app_bar.dart';

class ProfileLoadingView extends StatelessWidget {
  const ProfileLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: NeutralColors.background,
      appBar: ProfileAppBar(),
      body: Center(
        child: CircularProgressIndicator(color: PrimaryColors.defaultColor),
      ),
    );
  }
}
