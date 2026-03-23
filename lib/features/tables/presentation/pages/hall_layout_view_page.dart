import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../widgets/hall_layout_view/components/hall_layout_app_bar.dart';
import '../widgets/hall_layout_view/components/hall_layout_body.dart';

class HallLayoutViewPage extends StatelessWidget {
  final HallModel hall;

  const HallLayoutViewPage({
    super.key,
    required this.hall,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeutralColors.background,
      appBar: HallLayoutAppBar(hall: hall),
      body: const HallLayoutBody(),
    );
  }
}

