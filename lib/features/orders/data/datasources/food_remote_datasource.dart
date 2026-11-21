import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

abstract class IFoodRemoteDataSource {
  Future<List<FoodModel>> getAllFoodItems();
  Future<FoodModel?> getFoodById(String foodId);
}

class FoodRemoteDataSourceImpl
    with BaseRemoteDataSource
    implements IFoodRemoteDataSource {
  final FirebaseFirestore _firestore;

  FoodRemoteDataSourceImpl(this._firestore);

  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.rmsCollection(MenuDbConstants.foods);

  @override
  Future<List<FoodModel>> getAllFoodItems() {
    return performSafeCall(
      () async {
        QuerySnapshot<Map<String, dynamic>> snapshot;
        try {
          // Attempt standard fetch with an 8-second window
          snapshot = await _collection
              .get(const GetOptions(source: Source.serverAndCache))
              .timeout(const Duration(seconds: 8));
        } catch (e) {
          log('[FoodRemoteDataSource] Server query took longer than 8s ($e). Checking local cache...');
          try {
            snapshot = await _collection.get(const GetOptions(source: Source.cache));
            if (snapshot.docs.isNotEmpty) {
              log('[FoodRemoteDataSource] Loaded ${snapshot.docs.length} items from cache.');
              return _parseFoodDocs(snapshot.docs);
            }
          } catch (_) {}

          // If cache was empty, continue waiting for server with extended timeout
          snapshot = await _collection.get();
        }

        return _parseFoodDocs(snapshot.docs);
      },
      taskName: 'FoodRemoteDataSource_getAllFoodItems',
      timeoutDuration: const Duration(seconds: 30),
    );
  }

  @override
  Future<FoodModel?> getFoodById(String foodId) {
    return performSafeCall(
      () async {
        final doc = await _collection.doc(foodId).get();
        if (!doc.exists || doc.data() == null) return null;
        return FoodModel.fromJson(doc.data()!, docId: doc.id);
      },
      taskName: 'FoodRemoteDataSource_getFoodById',
      timeoutDuration: const Duration(seconds: 30),
    );
  }

  List<FoodModel> _parseFoodDocs(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    final list = <FoodModel>[];
    for (final doc in docs) {
      try {
        final data = doc.data();
        list.add(FoodModel.fromJson(data, docId: doc.id));
      } catch (e, stack) {
        log('[FoodRemoteDataSource] Error parsing food doc ${doc.id}: $e\n$stack');
      }
    }
    return list;
  }
}
