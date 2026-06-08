import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

abstract class ICategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl
    with BaseRemoteDataSource
    implements ICategoryRemoteDataSource {
  final FirebaseFirestore _firestore;

  CategoryRemoteDataSourceImpl(this._firestore);

  CollectionReference<CategoryModel> get _categoryCollection => _firestore
      .collection(MenuDbConstants.categories)
      .withConverter<CategoryModel>(
        fromFirestore: (snapshot, _) =>
            CategoryModel.fromMap(snapshot.data()!..['id'] = snapshot.id),
        toFirestore: (category, _) => category.toMap(),
      );

  @override
  Future<List<CategoryModel>> getCategories() {
    return performSafeCall(() async {
      final snapshot = await _categoryCollection.orderBy('sortOrder').get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    }, taskName: 'CategoryRemoteDataSource_getCategories');
  }
}
