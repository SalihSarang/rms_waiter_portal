import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_event.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_state.dart';
import 'package:waiter_portal/features/auth/presentation/pages/login_screen.dart';
import 'package:waiter_portal/features/home/presentation/pages/main_screen.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();
    // Dispatch CheckAuthEvent when widget is first built to check persisted login
    context.read<AuthBloc>().add(CheckAuthEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return const MainScreen();
        } else if (state is UnAuthenticated || state is AuthError) {
          return const LoginScreen();
        }

        // Show loading spinner while checking init state
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
