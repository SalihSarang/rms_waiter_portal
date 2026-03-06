import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/features/auth/domain/usecases/update_last_active_usecase.dart';
import 'shift_event.dart';
import 'shift_state.dart';

/// The [ShiftBloc] is responsible for managing the operational shifts of the waiter.
/// it handles the lifecycle of a shift, including initiation (starting) and
/// termination (ending), while synchronizing state with the remote backend.
class ShiftBloc extends Bloc<ShiftEvent, ShiftState> {
  final UpdateLastActiveUseCase updateLastActiveUseCase;

  ShiftBloc({required this.updateLastActiveUseCase}) : super(ShiftInitial()) {
    // Defining how the BLoC responds to shift-related events.
    on<StartShiftEvent>(
      (event, emit) => _handleShiftUpdate(event.uid, true, emit),
    );
    on<EndShiftEvent>(
      (event, emit) => _handleShiftUpdate(event.uid, false, emit),
    );
  }

  /// Manages the transition between shift states by updating the waiter's activity status.
  /// This internal handler coordinates with the [UpdateLastActiveUseCase] to ensure
  /// the backend reflects the waiter's current operational status.
  Future<void> _handleShiftUpdate(
    String uid,
    bool isStarting,
    Emitter<ShiftState> emit,
  ) async {
    emit(ShiftLoading());
    try {
      final now = DateTime.now();
      debugPrint(
        'Processing shift transition: ${isStarting ? "START" : "END"} at $now',
      );

      // Persist the activity event to the remote backend.
      await updateLastActiveUseCase(uid, now);

      if (isStarting) {
        debugPrint('Shift successfully initiated for waiter: $uid');
        emit(ShiftActive(now));
      } else {
        debugPrint('Shift successfully terminated for waiter: $uid');
        emit(ShiftEnded(now));
      }
    } catch (e) {
      debugPrint('Critical failure during shift transition for UID $uid: $e');
      emit(
        ShiftError(
          'Failed to update shift status. Please check your connection and try again.',
        ),
      );
    }
  }
}
