import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class TableViewState extends Equatable {
  final List<HallModel> halls;
  final HallModel? selectedHall;
  final List<TableModel> tables;
  final bool isLoading;
  final String? error;

  const TableViewState({
    this.halls = const [],
    this.selectedHall,
    this.tables = const [],
    this.isLoading = false,
    this.error,
  });

  TableViewState copyWith({
    List<HallModel>? halls,
    HallModel? selectedHall,
    List<TableModel>? tables,
    bool? isLoading,
    String? error,
  }) {
    return TableViewState(
      halls: halls ?? this.halls,
      selectedHall: selectedHall ?? this.selectedHall,
      tables: tables ?? this.tables,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  // Helper when intentionally unsetting a selected hall
  TableViewState copyWithSelectedHall(HallModel? hall) {
    return TableViewState(
      halls: halls,
      selectedHall: hall,
      tables: tables,
      isLoading: isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [halls, selectedHall, tables, isLoading, error];
}
