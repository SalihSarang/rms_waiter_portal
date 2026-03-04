import 'package:rms_shared_package/models/staff_model/staff_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final StaffModel staff;

  Authenticated(this.staff);
}

class UnAuthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
