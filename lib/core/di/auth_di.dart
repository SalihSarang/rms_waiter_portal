import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waiter_portal/core/di/injector.dart';
import 'package:waiter_portal/features/auth/data/datasources/waiter_auth_remote_datasource.dart';
import 'package:waiter_portal/features/auth/data/repositories/waiter_auth_repo_impl.dart';
import 'package:waiter_portal/features/auth/domain/repositories/auth_repository.dart';
import 'package:waiter_portal/features/auth/domain/usecases/check_auth_status.dart';
import 'package:waiter_portal/features/auth/domain/usecases/sign_in_waiter.dart';
import 'package:waiter_portal/features/auth/domain/usecases/sign_out_waiter.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc.dart';

void authDI() {
  // Firebase Auth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Data Sources
  getIt.registerLazySingleton<WaiterAuthRemoteDataSource>(
    () => WaiterAuthRemoteDataSourceImpl(
      auth: getIt<FirebaseAuth>(),
      firestore: getIt<FirebaseFirestore>(),
    ),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => WaiterAuthRepoImpl(
      remoteDataSource: getIt<WaiterAuthRemoteDataSource>(),
    ),
  );

  // Use Cases
  getIt.registerLazySingleton(() => SignInWaiter(getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => SignOutWaiter(getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => CheckAuthStatus(getIt<AuthRepository>()));

  // BLoC
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      signInWaiter: getIt(),
      signOutWaiter: getIt(),
      checkAuthStatus: getIt(),
    ),
  );
}
