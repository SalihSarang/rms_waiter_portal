import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';

abstract class IFoodRemoteDataSource {
  Future<List<FoodModel>> getAllFoodItems();
}

class FoodRemoteDataSourceImpl
    with BaseRemoteDataSource
    implements IFoodRemoteDataSource {
  final FirebaseFirestore _firestore;

  FoodRemoteDataSourceImpl(this._firestore);

  CollectionReference<FoodModel> get _foodCollection => _firestore
      .collection(MenuDbConstants.foods)
      .withConverter<FoodModel>(
        fromFirestore: (snapshot, _) {
          final data = snapshot.data()!;
          // Function to sanitize price in a list of maps
          List sanitizePrice(dynamic list) {
            if (list == null || list is! List) return list ?? [];
            return list.map((item) {
              final map = Map<String, dynamic>.from(item as Map);
              if (map['price'] != null) {
                map['price'] = (map['price'] as num).toDouble();
              }
              return map;
            }).toList();
          }

          // Sanitize both portions and addOns
          data['portions'] = sanitizePrice(data['portions']);
          data['addOns'] = sanitizePrice(data['addOns']);

          return FoodModel.fromJson(data, docId: snapshot.id);
        },
        toFirestore: (food, _) => food.toJson(),
      );

  @override
  Future<List<FoodModel>> getAllFoodItems() {
    return performSafeCall(() async {
      final snapshot = await _foodCollection.get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    }, taskName: 'FoodRemoteDataSource_getAllFoodItems');
  }
}
