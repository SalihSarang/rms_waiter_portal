import 'package:rms_shared_package/models/menu_models/category_model/category_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> getCategories();
}
