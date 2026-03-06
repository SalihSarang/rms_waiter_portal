import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:waiter_portal/core/di/auth_di.dart';

final getIt = GetIt.instance;

void setupDI() {
  // Firebase
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  // Auth DI
  authDI();
}
