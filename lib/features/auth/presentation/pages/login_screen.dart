import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/auth_bloc/auth_state.dart';
import '../utils/auth_listeners.dart';
import '../widgets/login_footer.dart';
import '../widgets/login_body.dart';
import '../bloc/login_form/login_form_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormCubit(),
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: AuthListeners.onAuthStateChanged,
          child: const LoginBody(),
        ),
        bottomNavigationBar: LoginFooter(onContactManager: () {}),
      ),
    );
  }
}
