import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/hall_repository.dart';
import '../../domain/repositories/table_repository.dart';
import 'table_view_event.dart';
import 'table_view_state.dart';

class TableViewBloc extends Bloc<TableViewEvent, TableViewState> {
  final IHallRepository _hallRepository;
  final ITableRepository _tableRepository;

  TableViewBloc({
    required IHallRepository hallRepository,
    required ITableRepository tableRepository,
  }) : _hallRepository = hallRepository,
       _tableRepository = tableRepository,
       super(const TableViewState()) {
    on<TableViewInit>(_onInit);
    on<TableViewHallSelected>(_onHallSelected);
  }

  Future<void> _onInit(
    TableViewInit event,
    Emitter<TableViewState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final halls = await _hallRepository.getHalls();
      emit(state.copyWith(halls: halls, isLoading: false));

      if (halls.isNotEmpty) {
        add(TableViewHallSelected(halls.first));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onHallSelected(
    TableViewHallSelected event,
    Emitter<TableViewState> emit,
  ) async {
    // If selecting the same hall, no need to re-fetch
    if (state.selectedHall?.id == event.hall.id) {
      return;
    }

    emit(state.copyWith(isLoading: true, error: null));
    try {
      final tables = await _tableRepository.getTables(event.hall.id);
      emit(
        state
            .copyWithSelectedHall(event.hall)
            .copyWith(tables: tables, isLoading: false),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
