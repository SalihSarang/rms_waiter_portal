import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/core/di/bloc_providers.dart';

import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_state.dart';
import 'features/auth/presentation/pages/auth_gate.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final staffId = authState is Authenticated
            ? authState.staff.id
            : 'unauth';
        return MultiBlocProvider(
          key: ValueKey(staffId),
          providers: getAppProviders(authState),
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
      },
    );
  }
}
