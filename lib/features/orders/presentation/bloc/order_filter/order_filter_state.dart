import 'package:equatable/equatable.dart';

class OrderFilterState extends Equatable {
  final String selectedFilter;

  const OrderFilterState({required this.selectedFilter});

  factory OrderFilterState.initial() =>
      const OrderFilterState(selectedFilter: 'All');

  OrderFilterState copyWith({String? selectedFilter}) {
    return OrderFilterState(
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }

  @override
  List<Object> get props => [selectedFilter];
}
