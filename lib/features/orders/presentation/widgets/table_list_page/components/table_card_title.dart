import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class TableCardTitle extends StatelessWidget {
  final String name;

  const TableCardTitle({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        color: NeutralColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
