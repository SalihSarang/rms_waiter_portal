import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'profile_action_section.dart';
import 'profile_app_bar.dart';
import 'profile_header/profile_header.dart';
import 'profile_personal_section.dart';
import 'profile_stats_row.dart';
import 'profile_version_footer.dart';

class ProfileAuthenticatedView extends StatelessWidget {
  const ProfileAuthenticatedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: NeutralColors.background,
      appBar: ProfileAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(),
            SizedBox(height: 24),
            ProfileStatsRow(),
            SizedBox(height: 24),
            ProfilePersonalSection(),
            SizedBox(height: 24),
            ProfileActionSection(),
            SizedBox(height: 30),
            ProfileVersionFooter(),
          ],
        ),
      ),
    );
  }
}
