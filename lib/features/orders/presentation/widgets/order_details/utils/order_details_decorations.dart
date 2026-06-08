import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class OrderDetailsDecorations {
  static BoxDecoration get footerDecoration => const BoxDecoration(
    color: NeutralColors.appBarBackground,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(24),
      topRight: Radius.circular(24),
    ),
    boxShadow: [
      BoxShadow(
        color: NeutralColors.shadowLight,
        blurRadius: 10,
        offset: Offset(0, -5),
      ),
    ],
  );
}
