import 'package:flutter/material.dart';
import 'profile_header/profile_header.dart';
import 'profile_stats_section.dart';
import 'profile_personal_section.dart';
import 'profile_action_section.dart';
import 'profile_version_footer.dart';
import 'profile_logout_section.dart';

/// The main authenticated view for the Profile Screen.
///
/// This follows the "Table of Contents" architecture, providing a clear
/// structural overview of the profile components.
class ProfileAuthenticatedView extends StatelessWidget {
  const ProfileAuthenticatedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileHeader(),
              const SizedBox(height: 32),
              const ProfileStatsSection(),
              const SizedBox(height: 32),
              const ProfileActionSection(),
              const SizedBox(height: 32),
              const ProfilePersonalSection(),
              const SizedBox(height: 32),
              const ProfileLogoutSection(),
              const SizedBox(height: 40),
              const ProfileVersionFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
