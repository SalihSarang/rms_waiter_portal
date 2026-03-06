abstract class ShiftEvent {}

class StartShiftEvent extends ShiftEvent {
  final String uid;
  StartShiftEvent(this.uid);
}

class EndShiftEvent extends ShiftEvent {
  final String uid;
  EndShiftEvent(this.uid);
}
