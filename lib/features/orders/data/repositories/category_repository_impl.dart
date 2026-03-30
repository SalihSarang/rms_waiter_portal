import 'package:rms_shared_package/models/menu_models/category_model/category_model.dart';
import '../../domain/repositories/category_repository.dart';
import '../datasources/category_remote_datasource.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final ICategoryRemoteDataSource _remoteDataSource;

  CategoryRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final categories = await _remoteDataSource.getCategories();
    return categories.where((category) => category.isActive).toList();
  }
}
