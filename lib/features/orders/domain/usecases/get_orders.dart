import 'package:rms_shared_package/rms_shared_package.dart';
import '../repositories/order_repository.dart';

class GetOrders {
  final OrderRepository _orderRepository;

  GetOrders(this._orderRepository);

  Stream<List<OrderModel>> call() {
    return _orderRepository.getOrders();
  }
}
