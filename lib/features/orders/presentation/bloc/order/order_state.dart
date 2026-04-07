import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {}

class OrderInProgress extends OrderState {
  final OrderModel order;

  const OrderInProgress(this.order);

  @override
  List<Object?> get props => [order];
}

class OrderLoading extends OrderState {}

class OrderSuccess extends OrderState {}

class OrderError extends OrderState {
  final String message;

  const OrderError(this.message);

  @override
  List<Object?> get props => [message];
}
