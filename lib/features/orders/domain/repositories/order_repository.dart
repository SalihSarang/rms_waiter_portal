import 'package:rms_shared_package/rms_shared_package.dart';

abstract class OrderRepository {
  Stream<List<OrderModel>> getOrders();
  Future<void> updateOrderStatus(String orderId, OrderStatus status);
  Future<void> createOrder(OrderModel order);
}
