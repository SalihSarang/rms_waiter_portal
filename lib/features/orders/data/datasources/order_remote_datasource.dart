import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

abstract class IOrderRemoteDataSource {
  Stream<List<OrderModel>> getOrders();
  Future<void> updateOrderStatus(String orderId, OrderStatus status);
  Future<void> createOrder(OrderModel order);
  Future<void> updateTableOccupiedSeats(String tableId, int delta);
}

class OrderRemoteDataSourceImpl
    with BaseRemoteDataSource
    implements IOrderRemoteDataSource {
  final FirebaseFirestore _firestore;

  OrderRemoteDataSourceImpl(this._firestore);

  @override
  Stream<List<OrderModel>> getOrders() {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return Stream.value([]);
    }
    return _firestore
        .collection(OrderDbConstants.orders)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => OrderModel.fromJson(doc.data()))
              .where((order) => order.staffId == uid)
              .toList();
        });
  }

  @override
  Future<void> updateOrderStatus(String orderId, OrderStatus status) async {
    await performSafeCall(
      () => _firestore.collection(OrderDbConstants.orders).doc(orderId).update({
        'orderStatus': status.name,
      }),
      taskName: 'UpdateOrderStatus',
    );
  }

  @override
  Future<void> createOrder(OrderModel order) async {
    await performSafeCall(
      () => _firestore
          .collection(OrderDbConstants.orders)
          .doc(order.id)
          .set(order.toJson()),
      taskName: 'CreateOrder',
    );
  }

  @override
  Future<void> updateTableOccupiedSeats(String tableId, int delta) async {
    await performSafeCall(
      () => _firestore.collection(TableDbConstants.tables).doc(tableId).update({
        'occupiedSeats': FieldValue.increment(delta),
      }),
      taskName: 'UpdateTableOccupiedSeats',
    );
  }
}
