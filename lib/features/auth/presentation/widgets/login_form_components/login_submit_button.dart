import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../bloc/auth_bloc/auth_state.dart';
import '../../bloc/login_form/login_form_cubit.dart';
import '../../utils/login_utils.dart';

class LoginSubmitButton extends StatelessWidget {
  const LoginSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginFormCubit>();

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return RmsButton(
          text: 'Login',
          onPressed: () => LoginUtils.onLoginPressed(
            context: context,
            formKey: cubit.formKey,
            emailController: cubit.emailController,
            passwordController: cubit.passwordController,
          ),
          isLoading: state is AuthLoading,
        );
      },
    );
  }
}
