import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../utils/auth_listeners.dart';
import '../widgets/login_form.dart';
import '../widgets/login_footer.dart';
import '../widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeutralColors.background,
      body: BlocListener<AuthBloc, AuthState>(
        listener: AuthListeners.onAuthStateChanged,
        child: const SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [LoginHeader(), SizedBox(height: 48), LoginForm()],
            ),
          ),
        ),
      ),
      bottomNavigationBar: LoginFooter(onContactManager: () {}),
    );
  }
}
