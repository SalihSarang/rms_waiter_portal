import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/check_auth_status.dart';
import '../../domain/usecases/sign_in_waiter.dart';
import '../../domain/usecases/sign_out_waiter.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWaiter _signInWaiter;
  final SignOutWaiter _signOutWaiter;
  final CheckAuthStatus _checkAuthStatus;

  AuthBloc({
    required SignInWaiter signInWaiter,
    required SignOutWaiter signOutWaiter,
    required CheckAuthStatus checkAuthStatus,
  }) : _signInWaiter = signInWaiter,
       _signOutWaiter = signOutWaiter,
       _checkAuthStatus = checkAuthStatus,
       super(AuthInitial()) {
    on<CheckAuthEvent>(_onCheckAuthEvent);
    on<SignInEvent>(_onSignInEvent);
    on<SignOutEvent>(_onSignOutEvent);
  }

  Future<void> _onCheckAuthEvent(
    CheckAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await _checkAuthStatus();
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(UnAuthenticated());
    }
  }

  Future<void> _onSignInEvent(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await _signInWaiter(event.email, event.password);
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(AuthError('Failed to sign in. Please try again.'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignOutEvent(
    SignOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _signOutWaiter();
      emit(UnAuthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
