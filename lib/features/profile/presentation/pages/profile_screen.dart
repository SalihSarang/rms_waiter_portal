import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_state.dart';
import '../widgets/profile_action_section.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_header/profile_header.dart';
import '../widgets/profile_personal_section.dart';
import '../widgets/profile_stats_row.dart';
import '../widgets/profile_version_footer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isAuth = context.select((AuthBloc b) => b.state is Authenticated);
    if (!isAuth) {
      return const Scaffold(
        backgroundColor: NeutralColors.background,
        appBar: ProfileAppBar(),
        body: Center(child: CircularProgressIndicator()),
      );
    }

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
