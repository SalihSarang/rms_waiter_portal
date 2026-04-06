import 'package:rms_shared_package/rms_shared_package.dart';
import '../repositories/order_repository.dart';

class UpdateOrderStatus {
  final OrderRepository _orderRepository;

  UpdateOrderStatus(this._orderRepository);

  Future<void> call(String orderId, OrderStatus status) async {
    return await _orderRepository.updateOrderStatus(orderId, status);
  }
}
