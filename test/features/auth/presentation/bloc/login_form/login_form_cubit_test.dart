import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:waiter_portal/features/auth/presentation/bloc/login_form/login_form_cubit.dart';

void main() {
  group('LoginFormCubit', () {
    test('initial state is LoginFormState(isPasswordVisible: false)', () {
      final loginFormCubit = LoginFormCubit();
      expect(
        loginFormCubit.state,
        const LoginFormState(isPasswordVisible: false),
      );
      loginFormCubit.close();
    });

    blocTest<LoginFormCubit, LoginFormState>(
      'emits [LoginFormState(isPasswordVisible: true)] when togglePasswordVisibility is called',
      build: () => LoginFormCubit(),
      act: (cubit) => cubit.togglePasswordVisibility(),
      expect: () => [const LoginFormState(isPasswordVisible: true)],
    );

    blocTest<LoginFormCubit, LoginFormState>(
      'emits [LoginFormState(isPasswordVisible: true), LoginFormState(isPasswordVisible: false)] when togglePasswordVisibility is called twice',
      build: () => LoginFormCubit(),
      act: (cubit) {
        cubit.togglePasswordVisibility();
        cubit.togglePasswordVisibility();
      },
      expect: () => [
        const LoginFormState(isPasswordVisible: true),
        const LoginFormState(isPasswordVisible: false),
      ],
    );
  });
}
