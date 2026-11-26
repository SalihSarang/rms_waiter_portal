import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/auth_bloc/auth_event.dart';

class LoginUtils {
  static void onLoginPressed({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) {
    if (formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      if (DemoConfig.isDemoEmail(email)) {
        context.read<AuthBloc>().add(DemoSignInEvent());
      } else {
        context.read<AuthBloc>().add(
          SignInEvent(email: email, password: password),
        );
      }
    }
  }
}
