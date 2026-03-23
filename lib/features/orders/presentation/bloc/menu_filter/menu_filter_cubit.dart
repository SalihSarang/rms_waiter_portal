import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/menu_filter/menu_filter_state.dart';

/// [MenuFilterCubit] manages the local UI state for filtering menu items.
///
/// It handles search queries and category selection to refine the displayed
/// list of foods without re-fetching from the server.
class MenuFilterCubit extends Cubit<MenuFilterState> {
  MenuFilterCubit() : super(MenuFilterState.initial());

  /// Updates the currently selected category ID.
  void setCategory(String categoryId) {
    emit(state.copyWith(selectedCategoryId: categoryId));
  }

  /// Updates the current search query string.
  void setSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }
}
