import 'package:rms_shared_package/rms_shared_package.dart';

abstract class ShiftState {}

class ShiftInitial extends ShiftState {}

class ShiftLoading extends ShiftState {
  final ShiftReady? previous;

  ShiftLoading({this.previous});
}

class ShiftReady extends ShiftState {
  final ShiftSession? currentSession;
  final List<ShiftSession> history;

  ShiftReady({required this.currentSession, required this.history});

  ShiftStatus get status {
    if (currentSession == null) return ShiftStatus.ended;
    return currentSession!.status;
  }

  bool get canStart => currentSession == null;
  bool get canPause => currentSession?.status == ShiftStatus.active;
  bool get canResume => currentSession?.status == ShiftStatus.paused;
  bool get canEnd =>
      currentSession?.status == ShiftStatus.active ||
      currentSession?.status == ShiftStatus.paused;

  int get workedMinutes => currentSession == null
      ? 0
      : currentSession!.actualEnd != null
      ? currentSession!.workedMinutes
      : ShiftUtils.calculateLiveWorkedMinutes(currentSession);

  int get pauseMinutes =>
      currentSession?.pauseEntries.fold<int>(
        0,
        (sum, entry) => sum + entry.durationMinutes,
      ) ??
      0;

  String get actualWindowLabel =>
      ShiftUtils.formatSessionWindow(currentSession);
  String get workedLabel => ShiftUtils.formatMinutes(workedMinutes);
  String get pauseLabel => ShiftUtils.formatMinutes(pauseMinutes);
  String get statusLabel => ShiftUtils.formatStatus(status);
}

class ShiftError extends ShiftState {
  final String message;
  final ShiftReady? previous;

  ShiftError(this.message, {this.previous});
}

extension ShiftStateX on ShiftState {
  ShiftReady? get data {
    if (this is ShiftReady) return this as ShiftReady;
    if (this is ShiftLoading) return (this as ShiftLoading).previous;
    if (this is ShiftError) return (this as ShiftError).previous;
    return null;
  }
}
