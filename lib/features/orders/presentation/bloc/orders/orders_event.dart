import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object?> get props => [];
}

class LoadOrders extends OrdersEvent {}

class OrdersUpdated extends OrdersEvent {
  final List<OrderModel> orders;
  const OrdersUpdated(this.orders);

  @override
  List<Object?> get props => [orders];
}
