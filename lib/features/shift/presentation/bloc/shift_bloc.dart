import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

import 'shift_event.dart';
import 'shift_state.dart';

class ShiftBloc extends Bloc<ShiftEvent, ShiftState> {
  final GetCurrentShiftSession getCurrentShiftSession;
  final GetShiftHistory getShiftHistory;
  final StartShift startShift;
  final PauseShift pauseShift;
  final ResumeShift resumeShift;
  final EndShift endShift;

  ShiftBloc({
    required this.getCurrentShiftSession,
    required this.getShiftHistory,
    required this.startShift,
    required this.pauseShift,
    required this.resumeShift,
    required this.endShift,
  }) : super(ShiftInitial()) {
    on<LoadShiftEvent>(_onLoadShift);
    on<StartShiftEvent>(_onStartShift);
    on<PauseShiftEvent>(_onPauseShift);
    on<ResumeShiftEvent>(_onResumeShift);
    on<EndShiftEvent>(_onEndShift);
    on<ClearShiftEvent>((event, emit) => emit(ShiftInitial()));
  }

  Future<void> _onLoadShift(
    LoadShiftEvent event,
    Emitter<ShiftState> emit,
  ) async {
    await _refresh(event.staff.id, emit);
  }

  Future<void> _onStartShift(
    StartShiftEvent event,
    Emitter<ShiftState> emit,
  ) async {
    emit(ShiftLoading(previous: state.data));
    try {
      await startShift(event.staff);
      await _refresh(event.staff.id, emit);
    } catch (e) {
      emit(ShiftError(_cleanError(e), previous: state.data));
    }
  }

  Future<void> _onPauseShift(
    PauseShiftEvent event,
    Emitter<ShiftState> emit,
  ) async {
    emit(ShiftLoading(previous: state.data));
    try {
      await pauseShift(event.uid);
      await _refresh(event.uid, emit);
    } catch (e) {
      emit(ShiftError(_cleanError(e), previous: state.data));
    }
  }

  Future<void> _onResumeShift(
    ResumeShiftEvent event,
    Emitter<ShiftState> emit,
  ) async {
    emit(ShiftLoading(previous: state.data));
    try {
      await resumeShift(event.uid);
      await _refresh(event.uid, emit);
    } catch (e) {
      emit(ShiftError(_cleanError(e), previous: state.data));
    }
  }

  Future<void> _onEndShift(
    EndShiftEvent event,
    Emitter<ShiftState> emit,
  ) async {
    emit(ShiftLoading(previous: state.data));
    try {
      await endShift(event.uid);
      await _refresh(event.uid, emit);
    } catch (e) {
      emit(ShiftError(_cleanError(e), previous: state.data));
    }
  }

  Future<void> _refresh(String staffId, Emitter<ShiftState> emit) async {
    final results = await Future.wait<dynamic>([
      getCurrentShiftSession(staffId),
      getShiftHistory(staffId, limit: 10),
    ]);

    emit(
      ShiftReady(
        currentSession: results[0] as ShiftSession?,
        history: results[1] as List<ShiftSession>,
      ),
    );
  }

  String _cleanError(Object error) {
    final message = error.toString();
    return message.startsWith('Exception: ')
        ? message.replaceFirst('Exception: ', '')
        : message;
  }
}
