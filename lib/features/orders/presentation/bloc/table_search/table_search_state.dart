import 'package:equatable/equatable.dart';

class TableSearchState extends Equatable {
  final bool isSearchVisible;
  final String searchQuery;

  const TableSearchState({this.isSearchVisible = false, this.searchQuery = ''});

  TableSearchState copyWith({bool? isSearchVisible, String? searchQuery}) {
    return TableSearchState(
      isSearchVisible: isSearchVisible ?? this.isSearchVisible,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [isSearchVisible, searchQuery];
}
