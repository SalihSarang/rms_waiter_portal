import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_orders.dart';
import '../../../domain/usecases/update_order_status.dart';
import '../../../domain/repositories/order_repository.dart';

import 'package:rms_shared_package/rms_shared_package.dart';
import 'orders_event.dart';
import 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetOrders _getOrders;
  final UpdateOrderStatus _updateOrderStatus;
  final OrderRepository _orderRepository;

  OrdersBloc(this._getOrders, this._updateOrderStatus, this._orderRepository)
    : super(OrdersInitial()) {
    on<LoadOrders>(_onLoadOrders);
    on<UpdateOrderStatusEvent>(_onUpdateOrderStatus);
  }

  Future<void> _onLoadOrders(
    LoadOrders event,
    Emitter<OrdersState> emit,
  ) async {
    emit(OrdersLoading());
    await emit.forEach<List<OrderModel>>(
      _getOrders(),
      onData: (orders) => OrdersLoaded(orders),
      onError: (error, stackTrace) => OrdersError(error.toString()),
    );
  }

  Future<void> _onUpdateOrderStatus(
    UpdateOrderStatusEvent event,
    Emitter<OrdersState> emit,
  ) async {
    try {
      await _updateOrderStatus(event.orderId, event.newStatus);

      // If status is completed, decrement table occupancy
      if (event.newStatus == OrderStatus.completed &&
          event.tableId != null &&
          event.seatCount != null) {
        await _orderRepository.updateTableOccupiedSeats(
          event.tableId!,
          -event.seatCount!,
        );
      }
    } catch (e) {
      emit(OrdersError(e.toString()));
    }
  }
}
