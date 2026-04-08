import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../../../domain/repositories/order_repository.dart';

import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository _orderRepository;

  OrderBloc(this._orderRepository) : super(OrderInitial()) {
    on<InitOrder>(_onInitOrder);
    on<ResetOrder>(_onResetOrder);
    on<SubmitOrder>(_onSubmitOrder);
  }

  void _onInitOrder(InitOrder event, Emitter<OrderState> emit) {
    // Generate a new OrderModel with the provided table, seat, and staff info
    final newOrder = OrderModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      tableNumber: event.tableNumber,
      staffId: event.staffId,
      orderedMenu: [],
      paymentStatus: PaymentStatus.pending,
      orderStatus: OrderStatus.pending,
      totalAmount: 0.0,
      seatCount: event.seatCount,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final encoder = JsonEncoder.withIndent('  ', (object) {
      if (object is Timestamp) {
        return object.toDate().toIso8601String();
      }
      return object;
    });
    final orderJson = encoder.convert(newOrder.toJson());

    log('--- [OrderBloc] Order Initialized (Full Data) ---');
    log(orderJson);
    log('-----------------------------------');

    emit(OrderInProgress(newOrder));
  }

  void _onResetOrder(ResetOrder event, Emitter<OrderState> emit) {
    emit(OrderInitial());
  }

  Future<void> _onSubmitOrder(
    SubmitOrder event,
    Emitter<OrderState> emit,
  ) async {
    final currentState = state;
    if (currentState is OrderInProgress) {
      emit(OrderLoading());

      final order = currentState.order;
      final updatedOrder = OrderModel(
        id: order.id,
        tableNumber: order.tableNumber,
        staffId: order.staffId,
        orderedMenu: event.items,
        paymentStatus: order.paymentStatus,
        orderStatus: order.orderStatus,
        totalAmount: event.cartTotal,
        seatCount: order.seatCount,
        createdAt: order.createdAt,
        updatedAt: DateTime.now(),
      );

      try {
        await _orderRepository.createOrder(updatedOrder);
        emit(OrderSuccess());
      } catch (e) {
        emit(OrderError(ErrorHandler.getFriendlyMessage(e)));
      }
    }
  }
}
