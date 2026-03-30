import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// [MenuSearchBar] is an interactive text field for finding foods.
///
/// It updates the [MenuFilterCubit] on every keystroke, allowing for
/// a "search-as-you-type" experience.
///
/// The design uses a rounded [TextField] with a search icon prefix to
/// match the app's clean aesthetics.
class MenuSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const MenuSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(color: NeutralColors.white),
        decoration: InputDecoration(
          hintText: 'Search food or ID...',
          hintStyle: TextStyle(
            color: NeutralColors.icon.withValues(alpha: 0.5),
          ),
          prefixIcon: const Icon(Icons.search, color: NeutralColors.icon),
          filled: true,
          fillColor: NeutralColors.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
        ),
      ),
    );
  }
}
