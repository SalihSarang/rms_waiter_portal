import 'package:equatable/equatable.dart';
import '../../../domain/enums/order_filter.dart';

class OrderFilterState extends Equatable {
  final OrderFilter selectedFilter;

  const OrderFilterState({required this.selectedFilter});

  factory OrderFilterState.initial() =>
      const OrderFilterState(selectedFilter: OrderFilter.all);

  OrderFilterState copyWith({OrderFilter? selectedFilter}) {
    return OrderFilterState(
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }

  @override
  List<Object> get props => [selectedFilter];
}
