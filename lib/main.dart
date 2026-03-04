import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waiter_portal/firebase_options.dart';

import 'features/auth/data/datasources/waiter_auth_remote_datasource.dart';
import 'features/auth/data/repositories/waiter_auth_repo_impl.dart';
import 'features/auth/domain/usecases/check_auth_status.dart';
import 'features/auth/domain/usecases/sign_in_waiter.dart';
import 'features/auth/domain/usecases/sign_out_waiter.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Setup dependencies
    final remoteDataSource = WaiterAuthRemoteDataSourceImpl(
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
    );
    final authRepository = WaiterAuthRepoImpl(
      remoteDataSource: remoteDataSource,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            signInWaiter: SignInWaiter(authRepository),
            signOutWaiter: SignOutWaiter(authRepository),
            checkAuthStatus: CheckAuthStatus(authRepository),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Waiter Portal',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF4B8DF8),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
          fontFamily: 'Roboto',
        ),
        home: const AuthGate(),
      ),
    );
  }
}
