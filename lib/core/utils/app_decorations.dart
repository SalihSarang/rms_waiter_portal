import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Centralized decoration styles for badges and small UI indicators.
class AppDecorations {
  /// Returns a decoration for table seat badges, adjusting based on preview state.
  static BoxDecoration seatBadgeDecoration({
    required bool isPreview,
    Color? badgeBg,
  }) {
    return BoxDecoration(
      color: isPreview ? NeutralColors.border.withValues(alpha: 0.5) : badgeBg,
      borderRadius: BorderRadius.circular(10),
    );
  }

  /// Decoration for the shift history session cards.
  static BoxDecoration shiftHistoryCardDecoration() {
    return BoxDecoration(
      color: NeutralColors.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: NeutralColors.border.withValues(alpha: 0.3)),
    );
  }
}
