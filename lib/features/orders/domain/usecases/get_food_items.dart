import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';
import '../repositories/food_repository.dart';

class GetFoodItems {
  final FoodRepository repository;

  GetFoodItems(this.repository);

  Future<List<FoodModel>> call() async {
    return await repository.getAllFoodItems();
  }
}
