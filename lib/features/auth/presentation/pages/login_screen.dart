import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:waiter_portal/features/home/presentation/pages/main_screen.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../widgets/login_body.dart';
import '../widgets/login_footer.dart';
import '../widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeutralColors.background,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            RmsSnackbar.show(
              context,
              message: state.message,
              type: RmsSnackbarType.error,
            );
          } else if (state is Authenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const MainScreen()),
            );
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              const Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      LoginHeader(),
                      SizedBox(height: 48),
                      LoginBody(),
                    ],
                  ),
                ),
              ),
              LoginFooter(onContactManager: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
