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
    on<LoadOrder>(_onLoadOrder);
    on<SendToKitchen>(_onSendToKitchen);
    on<CancelOrder>(_onCancelOrder);
    on<SubmitOrder>(_onSubmitOrder);
    on<RequestBill>(_onRequestBill);
  }

  void _onInitOrder(InitOrder event, Emitter<OrderState> emit) {
    // Generate a new OrderModel with the provided table, seat, and staff info
    final newOrder = OrderModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      tableNumber: event.tableNumber,
      tableId: event.tableId,
      staffId: event.staffId,
      staffName: event.staffName,
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

  void _onLoadOrder(LoadOrder event, Emitter<OrderState> emit) {
    emit(OrderInProgress(event.order));
  }

  Future<void> _onSendToKitchen(
    SendToKitchen event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoading());

    // Mark all unsent items as sent
    final updatedMenu = event.order.orderedMenu.map((item) {
      if (!item.isSentToKitchen) {
        return CartItemModel(
          foodId: item.foodId,
          name: item.name,
          quantity: item.quantity,
          price: item.price,
          selectedPortion: item.selectedPortion,
          selectedAddOns: item.selectedAddOns,
          specialInstructions: item.specialInstructions,
          imageUrl: item.imageUrl,
          isSentToKitchen: true,
        );
      }
      return item;
    }).toList();

    final updatedOrder = OrderModel(
      id: event.order.id,
      tableNumber: event.order.tableNumber,
      tableId: event.order.tableId,
      staffId: event.order.staffId,
      staffName: event.order.staffName,
      orderedMenu: updatedMenu,
      paymentStatus: event.order.paymentStatus,
      orderStatus: OrderStatus.preparing,
      totalAmount: event.order.totalAmount,
      seatCount: event.order.seatCount,
      createdAt: event.order.createdAt,
      updatedAt: DateTime.now(),
    );

    try {
      await _orderRepository.createOrder(updatedOrder);
      emit(OrderSuccess());
    } catch (e) {
      emit(OrderError(ErrorHandler.getFriendlyMessage(e)));
    }
  }

  Future<void> _onCancelOrder(
    CancelOrder event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoading());

    try {
      // Update order status to cancelled
      await _orderRepository.updateOrderStatus(
        event.order.id,
        OrderStatus.cancelled,
      );

      // Decrement table occupancy (free up seats)
      await _orderRepository.updateTableOccupiedSeats(
        event.order.tableId,
        -event.order.seatCount,
      );

      emit(OrderSuccess());
    } catch (e) {
      emit(OrderError(ErrorHandler.getFriendlyMessage(e)));
    }
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
        tableId: order.tableId,
        staffId: order.staffId,
        staffName: order.staffName,
        orderedMenu: event.items,
        paymentStatus: order.paymentStatus,
        orderStatus:
            event.items.isNotEmpty &&
                event.items.every((item) => item.isPrepared)
            ? OrderStatus.served
            : (order.orderStatus == OrderStatus.served
                  ? OrderStatus.pending
                  : order.orderStatus),
        totalAmount: event.cartTotal,
        seatCount: order.seatCount,
        createdAt: order.createdAt,
        updatedAt: DateTime.now(),
      );

      try {
        await _orderRepository.createOrder(updatedOrder);
        // Increment table occupancy
        await _orderRepository.updateTableOccupiedSeats(
          order.tableId,
          order.seatCount,
        );
        emit(OrderSuccess());
      } catch (e) {
        emit(OrderError(ErrorHandler.getFriendlyMessage(e)));
      }
    }
  }

  Future<void> _onRequestBill(
    RequestBill event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderLoading());
    try {
      await _orderRepository.requestBill(event.orderId);
      emit(const OrderSuccess(message: 'Bill requested successfully!'));
    } catch (e) {
      emit(OrderError(ErrorHandler.getFriendlyMessage(e)));
    }
  }
}
