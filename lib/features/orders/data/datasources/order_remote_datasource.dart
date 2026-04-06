import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

abstract class IOrderRemoteDataSource {
  Stream<List<OrderModel>> getOrders();
  Future<void> updateOrderStatus(String orderId, OrderStatus status);
}

class OrderRemoteDataSourceImpl with BaseRemoteDataSource
    implements IOrderRemoteDataSource {
  final FirebaseFirestore _firestore;

  OrderRemoteDataSourceImpl(this._firestore);

  @override
  Stream<List<OrderModel>> getOrders() {
    return _firestore
        .collection(OrderDbConstants.orders)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return OrderModel.fromJson(doc.data());
      }).toList();
    });
  }

  @override
  Future<void> updateOrderStatus(String orderId, OrderStatus status) async {
    await performSafeCall(
      () => _firestore
          .collection(OrderDbConstants.orders)
          .doc(orderId)
          .update({'orderStatus': status.name}),
      taskName: 'UpdateOrderStatus',
    );
  }
}
