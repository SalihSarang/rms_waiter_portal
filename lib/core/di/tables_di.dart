import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waiter_portal/core/di/injector.dart';
import 'package:waiter_portal/features/tables/data/datasources/table_view_datasource.dart';
import 'package:waiter_portal/features/tables/data/repositories/hall_repository_impl.dart';
import 'package:waiter_portal/features/tables/data/repositories/table_repository_impl.dart';
import 'package:waiter_portal/features/tables/domain/repositories/hall_repository.dart';
import 'package:waiter_portal/features/tables/domain/repositories/table_repository.dart';
import 'package:waiter_portal/features/tables/presentation/bloc/table_view_bloc.dart';

void tablesDI() {
  // Remote Data Source
  getIt.registerLazySingleton<ITableViewRemoteDataSource>(
    () => TableViewRemoteDataSourceImpl(getIt<FirebaseFirestore>()),
  );

  // Repositories
  getIt.registerLazySingleton<IHallRepository>(
    () => HallRepositoryImpl(
      remoteDataSource: getIt<ITableViewRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<ITableRepository>(
    () => TableRepositoryImpl(
      remoteDataSource: getIt<ITableViewRemoteDataSource>(),
    ),
  );

  // Bloc
  getIt.registerFactory<TableViewBloc>(
    () => TableViewBloc(
      hallRepository: getIt<IHallRepository>(),
      tableRepository: getIt<ITableRepository>(),
    ),
  );
}
