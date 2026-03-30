abstract class ShiftState {}

class ShiftInitial extends ShiftState {}

class ShiftLoading extends ShiftState {}

class ShiftActive extends ShiftState {
  final DateTime startTime;
  ShiftActive(this.startTime);
}

class ShiftEnded extends ShiftState {
  final DateTime endTime;
  ShiftEnded(this.endTime);
}

class ShiftError extends ShiftState {
  final String message;
  ShiftError(this.message);
}
