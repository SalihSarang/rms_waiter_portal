import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/models/menu_models/category_model/category_model.dart';
import '../../../../bloc/menu_filter/menu_filter_cubit.dart';
import '../../../../bloc/menu_filter/menu_filter_state.dart';
import 'category_filter_chip.dart';

class CategoryFilterList extends StatelessWidget {
  final List<CategoryModel> allCategories;
  final MenuFilterState state;

  const CategoryFilterList({
    super.key,
    required this.allCategories,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
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

          return CategoryFilterChip(
            category: category,
            isSelected: isSelected,
            onTap: () => context.read<MenuFilterCubit>().setCategory(category.id),
          );
        },
      ),
    );
  }
}
