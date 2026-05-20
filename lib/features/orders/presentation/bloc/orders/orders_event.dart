import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object?> get props => [];
}

class LoadOrders extends OrdersEvent {}

class UpdateOrderStatusEvent extends OrdersEvent {
  final String orderId;
  final OrderStatus newStatus;
  final String? tableId;
  final int? seatCount;

  const UpdateOrderStatusEvent({
    required this.orderId,
    required this.newStatus,
    this.tableId,
    this.seatCount,
  });

  @override
  List<Object?> get props => [orderId, newStatus, tableId, seatCount];
}
