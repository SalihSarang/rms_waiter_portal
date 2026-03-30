import 'package:rms_shared_package/models/staff_model/staff_model.dart';

abstract class AuthEvent {}

class CheckAuthEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});
}

class SignOutEvent extends AuthEvent {}

class AuthStatusChangedEvent extends AuthEvent {
  final StaffModel? staff;

  AuthStatusChangedEvent(this.staff);
}
