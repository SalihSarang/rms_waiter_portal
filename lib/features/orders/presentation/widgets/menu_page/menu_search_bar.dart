import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// [MenuSearchBar] is an interactive text field for finding foods.
///
/// It updates the [MenuFilterCubit] on every keystroke, allowing for
/// a "search-as-you-type" experience.
///
/// The design uses a rounded [TextField] with a search icon prefix to
/// match the app's clean aesthetics.
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/menu_filter/menu_filter_cubit.dart';

class MenuSearchBar extends StatelessWidget {
  const MenuSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: (value) =>
            context.read<MenuFilterCubit>().setSearchQuery(value),
        style: const TextStyle(color: TextColors.primary),
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
