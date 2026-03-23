import 'package:rms_shared_package/models/menu_models/category_model/category_model.dart';
import '../repositories/category_repository.dart';

class GetCategories {
  final CategoryRepository repository;

  GetCategories(this.repository);

  Future<List<CategoryModel>> call() async {
    return await repository.getCategories();
  }
}
