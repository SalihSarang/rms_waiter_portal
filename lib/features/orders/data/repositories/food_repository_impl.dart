import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';
import '../../domain/repositories/food_repository.dart';
import '../datasources/food_remote_datasource.dart';

class FoodRepositoryImpl implements FoodRepository {
  final IFoodRemoteDataSource _remoteDataSource;

  FoodRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<FoodModel>> getAllFoodItems() async {
    return await _remoteDataSource.getAllFoodItems();
  }
}
