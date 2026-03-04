import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/app_colors/primary_colors.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'auth_button.dart';
import 'auth_text_field.dart';
import '../../../../core/utils/validators.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
          AuthTextField(
            controller: _emailController,
            label: 'Waiter ID or Email',
            hintText: 'Enter your ID',
            suffixIcon: const Icon(Icons.person_outline, color: Colors.white38),
            validator: Validators.validateEmail,
          ),
          const SizedBox(height: 24),
          AuthTextField(
            controller: _passwordController,
            label: 'PIN / Password',
            hintText: '••••',
            obscureText: _obscurePassword,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Colors.white38,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            validator: Validators.validatePassword,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot password?',
                style: TextStyle(color: PrimaryColors.defaultColor),
              ),
            ),
          ),
          const SizedBox(height: 40),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return AuthButton(
                text: 'Login',
                isLoading: state is AuthLoading,
                onPressed: _onLoginPressed,
              );
            },
          ),
        ],
      ),
    );
  }
}
