import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<InitOrder>(_onInitOrder);
    on<ResetOrder>(_onResetOrder);
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

    // LOGGING: As requested, we log the full OrderModel data
    // Handles Timestamp objects that are not natively JSON-serializable.
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
}
