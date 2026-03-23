import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../../../../core/utils/validators.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _obscurePasswordNotifier = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _obscurePasswordNotifier.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      context.read<AuthBloc>().add(
        SignInEvent(email: email, password: password),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RmsTextField(
            controller: _emailController,
            label: 'Waiter ID or Email',
            hintText: 'Enter your ID',
            suffixIcon: const Icon(
              Icons.person_outline,
              color: NeutralColors.icon,
            ),
            validator: Validators.validateEmail,
          ),
          const SizedBox(height: 24),
          ValueListenableBuilder<bool>(
            valueListenable: _obscurePasswordNotifier,
            builder: (context, obscurePassword, child) {
              return RmsTextField(
                controller: _passwordController,
                label: 'Password',
                hintText: 'Password',
                obscureText: obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: NeutralColors.icon,
                  ),
                  onPressed: () {
                    _obscurePasswordNotifier.value =
                        !_obscurePasswordNotifier.value;
                  },
                ),
                validator: Validators.validatePassword,
              );
            },
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot password?',
                style: TextStyle(
                  color: PrimaryColors.defaultColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return RmsButton(
                text: 'Login',
                onPressed: _onLoginPressed,
                isLoading: state is AuthLoading,
              );
            },
          ),
        ],
      ),
    );
  }
}
