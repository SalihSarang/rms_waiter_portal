import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:waiter_portal/core/di/auth_di.dart';
import 'package:waiter_portal/core/di/menu_di.dart';
import 'package:waiter_portal/core/di/tables_di.dart';
import 'package:waiter_portal/core/di/cart_di.dart';
import 'package:waiter_portal/core/di/orders_di.dart';

final getIt = GetIt.instance;

void setupDI() {
  // Firebase
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  // Auth DI
  authDI();

  // Tables DI
  tablesDI();

  // Menu DI
  menuDI();

  // Cart DI
  cartDI();

  // Orders DI
  ordersDI();
}

