import 'package:flutter/material.dart';
import 'hall_layout_canvas.dart';
import 'hall_layout_loading_indicator.dart';

class HallLayoutContentView extends StatelessWidget {
  final bool isLoading;

  const HallLayoutContentView({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HallLayoutCanvas(),
        if (isLoading) const HallLayoutLoadingIndicator(),
      ],
    );
  }
}
