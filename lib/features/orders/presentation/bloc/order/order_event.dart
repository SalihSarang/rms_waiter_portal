import 'package:equatable/equatable.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class InitOrder extends OrderEvent {
  final String tableNumber;
  final int seatCount;
  final String staffId;

  const InitOrder({
    required this.tableNumber,
    required this.seatCount,
    required this.staffId,
  });

  @override
  List<Object?> get props => [tableNumber, seatCount, staffId];
}

class ResetOrder extends OrderEvent {}
