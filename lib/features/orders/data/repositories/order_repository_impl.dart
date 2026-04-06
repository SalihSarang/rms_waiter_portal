import 'package:rms_shared_package/rms_shared_package.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_remote_datasource.dart';

class OrderRepositoryImpl implements OrderRepository {
  final IOrderRemoteDataSource _remoteDataSource;

  OrderRepositoryImpl(this._remoteDataSource);

  @override
  Stream<List<OrderModel>> getOrders() {
    return _remoteDataSource.getOrders();
  }

  @override
  Future<void> updateOrderStatus(String orderId, OrderStatus status) async {
    return await _remoteDataSource.updateOrderStatus(orderId, status);
  }
}
