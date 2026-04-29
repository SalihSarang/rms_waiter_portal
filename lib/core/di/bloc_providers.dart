import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/core/di/injector.dart';

import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc/auth_state.dart';
import 'package:waiter_portal/features/shift/presentation/bloc/shift_bloc.dart';
import 'package:waiter_portal/features/shift/presentation/bloc/shift_event.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/cart/cart_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/order/order_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/orders/orders_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/orders/orders_event.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/menu/menu_bloc.dart';
import 'package:waiter_portal/features/orders/presentation/bloc/menu/menu_event.dart';

List<BlocProvider> getAppProviders(AuthState authState) {
  return [
    BlocProvider<ShiftBloc>(
      create: (context) {
        final bloc = getIt<ShiftBloc>();
        if (authState is Authenticated) {
          bloc.add(LoadShiftEvent(authState.staff));
        }
        return bloc;
      },
    ),
    BlocProvider<CartBloc>(create: (context) => getIt<CartBloc>()),
    BlocProvider<OrderBloc>(create: (context) => getIt<OrderBloc>()),
    BlocProvider<OrdersBloc>(
      create: (context) {
        final bloc = getIt<OrdersBloc>();
        if (authState is Authenticated) {
          bloc.add(LoadOrders());
        }
        return bloc;
      },
    ),
    BlocProvider<MenuBloc>(
      create: (context) {
        final bloc = getIt<MenuBloc>();
        if (authState is Authenticated) {
          bloc.add(FetchMenu());
        }
        return bloc;
      },
    ),
  ];
}
