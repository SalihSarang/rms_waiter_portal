import 'package:waiter_portal/core/di/injector.dart';
import 'package:waiter_portal/features/orders/data/datasources/order_remote_datasource.dart';
import 'package:waiter_portal/features/orders/data/repositories/order_repository_impl.dart';
import 'package:waiter_portal/features/orders/domain/repositories/order_repository.dart';
import 'package:waiter_portal/features/orders/domain/usecases/get_orders.dart';
import 'package:waiter_portal/features/orders/domain/usecases/update_order_status.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/order/order_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/orders/orders_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/seat_count/seat_count_cubit.dart';

void ordersDI() {
  // Data Sources
  getIt.registerLazySingleton<IOrderRemoteDataSource>(
    () => OrderRemoteDataSourceImpl(getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(getIt()),
  );

  // Use Cases
  getIt.registerLazySingleton(() => GetOrders(getIt()));
  getIt.registerLazySingleton(() => UpdateOrderStatus(getIt()));

  // Blocs
  getIt.registerFactory(() => OrdersBloc(getIt(), getIt(), getIt()));
  getIt.registerFactory(() => OrderBloc(getIt()));
  getIt.registerFactory(() => SeatCountCubit());
}
