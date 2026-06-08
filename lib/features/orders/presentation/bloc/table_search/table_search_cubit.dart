import 'package:flutter_bloc/flutter_bloc.dart';
import 'table_search_state.dart';

/// [TableSearchCubit] manages the UI state for searching tables.
///
/// It handles:
/// 1. Toggling the visibility of the search bar in the AppBar.
/// 2. Tracking the current search query string.
class TableSearchCubit extends Cubit<TableSearchState> {
  TableSearchCubit() : super(const TableSearchState());

  /// Toggles the search bar visibility.
  /// If turning off, it also clears the search query.
  void toggleSearch() {
    if (state.isSearchVisible) {
      emit(const TableSearchState(isSearchVisible: false, searchQuery: ''));
    } else {
      emit(state.copyWith(isSearchVisible: true));
    }
  }

  /// Updates the current search query string.
  void updateSearch(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  /// Clears the search query and hides the search bar.
  void clearSearch() {
    emit(const TableSearchState(isSearchVisible: false, searchQuery: ''));
  }
}
