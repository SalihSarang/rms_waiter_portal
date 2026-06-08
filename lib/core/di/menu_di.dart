import 'package:waiter_portal/core/di/injector.dart';
import 'package:waiter_portal/features/orders/data/datasources/category_remote_datasource.dart';
import 'package:waiter_portal/features/orders/data/datasources/food_remote_datasource.dart';
import 'package:waiter_portal/features/orders/data/repositories/category_repository_impl.dart';
import 'package:waiter_portal/features/orders/data/repositories/food_repository_impl.dart';
import 'package:waiter_portal/features/orders/domain/repositories/category_repository.dart';
import 'package:waiter_portal/features/orders/domain/repositories/food_repository.dart';
import 'package:waiter_portal/features/orders/domain/usecases/get_categories.dart';
import 'package:waiter_portal/features/orders/domain/usecases/get_food_items.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/menu/menu_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/menu_filter/menu_filter_cubit.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/table_search/table_search_cubit.dart';

void menuDI() {
  // Data Sources
  getIt.registerLazySingleton<ICategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<IFoodRemoteDataSource>(
    () => FoodRemoteDataSourceImpl(getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<FoodRepository>(
    () => FoodRepositoryImpl(getIt()),
  );

  // Use Cases
  getIt.registerLazySingleton(() => GetCategories(getIt()));
  getIt.registerLazySingleton(() => GetFoodItems(getIt()));

  // Blocs (Factory since they might be localized or reset)
  getIt.registerFactory(() => MenuBloc(getIt(), getIt()));
  getIt.registerFactory(() => MenuFilterCubit());
  getIt.registerFactory(() => TableSearchCubit());
}
