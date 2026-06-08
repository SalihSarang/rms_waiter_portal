import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';

abstract class FoodRepository {
  Future<List<FoodModel>> getAllFoodItems();
  Future<FoodModel?> getFoodById(String foodId);
}
