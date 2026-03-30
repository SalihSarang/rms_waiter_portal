import 'package:waiter_portal/core/di/injector.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/cart/cart_bloc.dart';

void cartDI() {
  getIt.registerLazySingleton<CartBloc>(() => CartBloc());
}
