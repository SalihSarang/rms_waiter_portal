import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/login_form/login_form_cubit.dart';
import '../../../../../core/utils/validators.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginFormCubit>();

    return Column(
      children: [
        RmsTextField(
          controller: cubit.emailController,
          label: 'Waiter ID or Email',
          hintText: 'Enter your ID',
          suffixIcon: const Icon(
            Icons.person_outline,
            color: NeutralColors.icon,
          ),
          validator: Validators.validateEmail,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
