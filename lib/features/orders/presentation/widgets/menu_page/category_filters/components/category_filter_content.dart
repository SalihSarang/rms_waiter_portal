import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/models/menu_models/category_model/category_model.dart';
import '../../../../bloc/menu_filter/menu_filter_cubit.dart';
import '../../../../bloc/menu_filter/menu_filter_state.dart';
import 'category_filter_list.dart';

class CategoryFilterContent extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoryFilterContent({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuFilterCubit, MenuFilterState>(
      builder: (context, state) {
        final allCategories = [
          CategoryModel(
            id: 'All',
            name: 'All',
            sortOrder: -1,
            isActive: true,
          ),
          ...categories,
        ];

        return Column(
          children: [
            CategoryFilterList(allCategories: allCategories, state: state),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
