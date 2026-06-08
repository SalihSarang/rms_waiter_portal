import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/tables/presentation/painters/dot_grid_painter.dart';

class CanvasGridBackground extends StatelessWidget {
  const CanvasGridBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const RepaintBoundary(
      child: CustomPaint(painter: DotGridPainter(color: NeutralColors.border)),
    );
  }
}
