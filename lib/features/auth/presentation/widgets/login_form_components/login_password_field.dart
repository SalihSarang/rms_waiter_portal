import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/login_form/login_form_cubit.dart';
import '../../../../../core/utils/validators.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginFormCubit>();

    return BlocBuilder<LoginFormCubit, LoginFormState>(
      buildWhen: (previous, current) =>
          previous.isPasswordVisible != current.isPasswordVisible,
      builder: (context, state) {
        return RmsTextField(
          controller: cubit.passwordController,
          label: 'Password',
          hintText: 'Password',
          obscureText: !state.isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              state.isPasswordVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: NeutralColors.icon,
            ),
            onPressed: cubit.togglePasswordVisibility,
          ),
          validator: Validators.validatePassword,
        );
      },
    );
  }
}
