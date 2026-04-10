import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/models/menu_models/category_model/category_model.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/menu_filter/menu_filter_state.dart';
import '../../../bloc/menu_filter/menu_filter_cubit.dart';
import 'components/category_filter_chip.dart';

/// [CategoryFilters] is a horizontal scrolling list of menu categories.
///
/// Its primary responsibility is to orchestrate the rendering of category
/// filters using specialized [CategoryFilterChip] components.
class CategoryFilters extends StatelessWidget {
  final List<CategoryModel> categories;
  final ValueChanged<String> onCategorySelected;

  const CategoryFilters({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuFilterCubit, MenuFilterState>(
      builder: (context, state) {
        // VIRTUAL CATEGORY: We inject "All" to allow resetting current filters.
        final allCategories = [
          CategoryModel(id: 'All', name: 'All', sortOrder: -1, isActive: true),
          ...categories,
        ];

        return SizedBox(
          height: 40,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: allCategories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final category = allCategories[index];
              final isSelected = state.selectedCategoryId == category.id;

              // Delegate individual chip rendering to a specialized component.
              return CategoryFilterChip(
                category: category,
                isSelected: isSelected,
                onTap: () => onCategorySelected(category.id),
              );
            },
          ),
        );
      },
    );
  }
}
