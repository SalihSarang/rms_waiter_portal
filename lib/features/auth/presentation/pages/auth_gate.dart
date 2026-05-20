import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/auth_bloc/auth_state.dart';
import 'package:waiter_portal/features/auth/presentation/pages/blocked_screen.dart';
import 'package:waiter_portal/features/auth/presentation/pages/login_screen.dart';
import 'package:waiter_portal/features/bottom_nav/presentation/pages/main_screen.dart';
import '../widgets/auth_loading_view.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(CheckAuthEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return const BottomNav();
        } else if (state is AuthBlocked) {
          return const BlockedScreen();
        } else if (state is AuthInitial || state is AuthChecking) {
          return const AuthLoadingView();
        }

        return const LoginScreen();
      },
    );
  }
}
