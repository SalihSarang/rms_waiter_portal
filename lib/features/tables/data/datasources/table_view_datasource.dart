import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

abstract class ITableViewRemoteDataSource {
  Future<List<HallModel>> getHalls();
  Future<List<TableModel>> getTables(String hallId);
}

class TableViewRemoteDataSourceImpl
    with BaseRemoteDataSource
    implements ITableViewRemoteDataSource {
  final FirebaseFirestore _firestore;

  TableViewRemoteDataSourceImpl(this._firestore);

  CollectionReference<HallModel> get _hallsCollection => _firestore
      .collection(TableDbConstants.halls)
      .withConverter<HallModel>(
        fromFirestore: (snapshot, _) =>
            HallModel.fromMap(snapshot.data()!, snapshot.id),
        toFirestore: (hall, _) => hall.toMap(),
      );

  CollectionReference<TableModel> get _tablesCollection => _firestore
      .collection(TableDbConstants.tables)
      .withConverter<TableModel>(
        fromFirestore: (snapshot, _) =>
            TableModel.fromMap(snapshot.data()!, snapshot.id),
        toFirestore: (table, _) => table.toMap(),
      );

  @override
  Future<List<HallModel>> getHalls() {
    return performSafeCall(() async {
      final snapshot = await _hallsCollection.orderBy('createdAt').get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    }, taskName: 'getAllHalls_waiter_portal');
  }

  @override
  Future<List<TableModel>> getTables(String hallId) {
    return performSafeCall(() async {
      final snapshot = await _tablesCollection
          .where('hallId', isEqualTo: hallId)
          .get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    }, taskName: 'getTablesByHallId_waiter_portal');
  }
}
