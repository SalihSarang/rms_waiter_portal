import 'package:rms_shared_package/models/staff_model/staff_model.dart';

abstract class ShiftEvent {}

class LoadShiftEvent extends ShiftEvent {
  final StaffModel staff;

  LoadShiftEvent(this.staff);
}

class StartShiftEvent extends ShiftEvent {
  final StaffModel staff;

  StartShiftEvent(this.staff);
}

class PauseShiftEvent extends ShiftEvent {
  final String uid;

  PauseShiftEvent(this.uid);
}

class ResumeShiftEvent extends ShiftEvent {
  final String uid;

  ResumeShiftEvent(this.uid);
}

class EndShiftEvent extends ShiftEvent {
  final String uid;

  EndShiftEvent(this.uid);
}

class ClearShiftEvent extends ShiftEvent {}
