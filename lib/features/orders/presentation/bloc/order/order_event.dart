import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class InitOrder extends OrderEvent {
  final String tableNumber;
  final String tableId;
  final int seatCount;
  final String staffId;

  const InitOrder({
    required this.tableNumber,
    required this.tableId,
    required this.seatCount,
    required this.staffId,
  });

  @override
  List<Object?> get props => [tableNumber, tableId, seatCount, staffId];
}

class ResetOrder extends OrderEvent {}

class SubmitOrder extends OrderEvent {
  final List<CartItemModel> items;
  final double cartTotal;

  const SubmitOrder({required this.items, required this.cartTotal});

  @override
  List<Object?> get props => [items, cartTotal];
}
