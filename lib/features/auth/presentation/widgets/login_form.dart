import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_form/login_form_cubit.dart';

import 'login_form_components/login_email_field.dart';
import 'login_form_components/login_password_field.dart';
import 'login_form_components/login_forgot_password_button.dart';
import 'login_form_components/login_submit_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginFormCubit>();

    return Form(
      key: cubit.formKey,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LoginEmailField(),
          LoginPasswordField(),
          LoginForgotPasswordButton(),
          LoginSubmitButton(),
        ],
      ),
    );
  }
}
