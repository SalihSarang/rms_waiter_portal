import 'package:equatable/equatable.dart';

class MenuFilterState extends Equatable {
  final String selectedCategoryId;
  final String searchQuery;

  const MenuFilterState({
    required this.selectedCategoryId,
    required this.searchQuery,
  });

  factory MenuFilterState.initial() =>
      const MenuFilterState(selectedCategoryId: 'All', searchQuery: '');

  MenuFilterState copyWith({String? selectedCategoryId, String? searchQuery}) {
    return MenuFilterState(
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [selectedCategoryId, searchQuery];
}
