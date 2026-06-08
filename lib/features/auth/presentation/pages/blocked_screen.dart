import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../widgets/blocked/blocked_hero_section.dart';
import '../widgets/blocked/blocked_help_card.dart';
import '../widgets/blocked/blocked_sign_out_button.dart';

class BlockedScreen extends StatelessWidget {
  const BlockedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: NeutralColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlockedHeroSection(),
              BlockedHelpCard(),
              BlockedSignOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
