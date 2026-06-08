import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class TableListBackButton extends StatelessWidget {
  const TableListBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: TextColors.primary,
        size: 20,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }
}
