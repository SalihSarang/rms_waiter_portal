import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class TableUtils {
  /// Filters the provided [tables] based on the [query].
  ///
  /// The search is case-insensitive and matches against the table name.
  static List<TableModel> filterTables(List<TableModel> tables, String query) {
    if (query.isEmpty) return tables;

    final lowercaseQuery = query.toLowerCase();
    return tables.where((table) {
      return table.name.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }

  /// Returns the decoration for a table filter chip based on its selection state.
  static BoxDecoration getTableFilterChipDecoration({
    required bool isSelected,
  }) {
    return BoxDecoration(
      color: isSelected ? PrimaryColors.defaultColor : NeutralColors.surface,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: isSelected ? PrimaryColors.defaultColor : NeutralColors.border,
      ),
    );
  }

  /// Returns the decoration for the 'Pan & Zoom' info tag.
  static BoxDecoration getPanZoomTagDecoration() {
    return BoxDecoration(
      color: PrimaryColors.defaultColor.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: PrimaryColors.defaultColor.withValues(alpha: 0.3),
      ),
    );
  }

  /// Returns the decoration for the hall selector card.
  static BoxDecoration getHallSelectorCardDecoration() {
    return BoxDecoration(
      color: NeutralColors.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: NeutralColors.border),
      boxShadow: [
        BoxShadow(
          color: NeutralColors.shadow.withValues(alpha: 0.2),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
