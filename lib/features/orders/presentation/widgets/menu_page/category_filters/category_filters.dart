import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/models/menu_models/category_model/category_model.dart';
import '../../../bloc/menu/menu_bloc.dart';
import '../../../bloc/menu/menu_state.dart';
import 'components/category_filter_content.dart';

/// [CategoryFilters] is a horizontal scrolling list of menu categories.
///
/// Its primary responsibility is to orchestrate the rendering of category
/// filters using specialized [CategoryFilterChip] components.

class CategoryFilters extends StatelessWidget {
  const CategoryFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, menuState) {
        final categories = menuState is MenuLoaded
            ? menuState.categories
            : <CategoryModel>[];

        return CategoryFilterContent(categories: categories);
      },
    );
  }
}
