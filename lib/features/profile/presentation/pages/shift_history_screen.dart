import 'package:flutter/material.dart';
import 'components/shift_history_app_bar.dart';
import 'components/shift_history_body.dart';

class ShiftHistoryScreen extends StatelessWidget {
  const ShiftHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const ShiftHistoryAppBar(),
      body: const ShiftHistoryBody(),
    );
  }
}
