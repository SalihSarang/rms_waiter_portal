import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'tables_screen_app_bar.dart';

class TablesLoadingView extends StatelessWidget {
  const TablesLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: NeutralColors.background,
      appBar: TablesScreenAppBar(),
      body: Center(
        child: CircularProgressIndicator(color: PrimaryColors.defaultColor),
      ),
    );
  }
}
