import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_orders.dart';

import 'orders_event.dart';
import 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetOrders _getOrders;
  StreamSubscription? _ordersSubscription;

  OrdersBloc(this._getOrders) : super(OrdersInitial()) {
    on<LoadOrders>(_onLoadOrders);
    on<OrdersUpdated>(_onOrdersUpdated);
  }

  Future<void> _onLoadOrders(LoadOrders event, Emitter<OrdersState> emit) async {
    emit(OrdersLoading());
    await _ordersSubscription?.cancel();
    _ordersSubscription = _getOrders().listen(
      (orders) => add(OrdersUpdated(orders)),
      onError: (error) => emit(OrdersError(error.toString())),
    );
  }

  void _onOrdersUpdated(OrdersUpdated event, Emitter<OrdersState> emit) {
    if (event.orders.isEmpty) {
      emit(const OrdersLoaded([]));
    } else {
      emit(OrdersLoaded(event.orders));
    }
  }

  @override
  Future<void> close() {
    _ordersSubscription?.cancel();
    return super.close();
  }
}
