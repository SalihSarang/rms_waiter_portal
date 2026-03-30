import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

abstract class TableViewEvent extends Equatable {
  const TableViewEvent();

  @override
  List<Object?> get props => [];
}

class TableViewInit extends TableViewEvent {}

class TableViewHallSelected extends TableViewEvent {
  final HallModel hall;
  const TableViewHallSelected(this.hall);

  @override
  List<Object?> get props => [hall];
}
