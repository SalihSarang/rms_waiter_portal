import 'package:flutter/material.dart';
import 'menu_search_bar.dart';
import 'category_filters/category_filters.dart';
import 'menu_body.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [MenuSearchBar(), CategoryFilters(), MenuBody()],
    );
  }
}
