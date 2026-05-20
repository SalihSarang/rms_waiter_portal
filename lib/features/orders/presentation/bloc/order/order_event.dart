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
  final String staffName;

  const InitOrder({
    required this.tableNumber,
    required this.tableId,
    required this.seatCount,
    required this.staffId,
    required this.staffName,
  });

  @override
  List<Object?> get props => [
    tableNumber,
    tableId,
    seatCount,
    staffId,
    staffName,
  ];
}

class ResetOrder extends OrderEvent {}

class SubmitOrder extends OrderEvent {
  final List<CartItemModel> items;
  final double cartTotal;

  const SubmitOrder({required this.items, required this.cartTotal});

  @override
  List<Object?> get props => [items, cartTotal];
}

class LoadOrder extends OrderEvent {
  final OrderModel order;

  const LoadOrder(this.order);

  @override
  List<Object?> get props => [order];
}

class SendToKitchen extends OrderEvent {
  final OrderModel order;

  const SendToKitchen(this.order);

  @override
  List<Object?> get props => [order];
}

class CancelOrder extends OrderEvent {
  final OrderModel order;
  final String? reason;

  const CancelOrder({required this.order, this.reason});

  @override
  List<Object?> get props => [order, reason];
}

class RequestBill extends OrderEvent {
  final String orderId;

  const RequestBill(this.orderId);

  @override
  List<Object?> get props => [orderId];
}
