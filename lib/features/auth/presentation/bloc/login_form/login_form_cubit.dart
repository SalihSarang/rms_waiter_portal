import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class LoginFormState extends Equatable {
  final bool isPasswordVisible;

  const LoginFormState({this.isPasswordVisible = false});

  LoginFormState copyWith({bool? isPasswordVisible}) {
    return LoginFormState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [isPasswordVisible];
}

class LoginFormCubit extends Cubit<LoginFormState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginFormCubit() : super(const LoginFormState());

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
