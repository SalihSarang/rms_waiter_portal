import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/check_auth_status.dart';
import '../../domain/usecases/sign_in_waiter.dart';
import '../../domain/usecases/sign_out_waiter.dart';
import 'auth_event.dart';
import 'auth_state.dart';

/// The [AuthBloc] serves as the central orchestration layer for all authentication-related logic.
/// It bridges the gap between raw data sources and the UI, managing the transition
/// between states such as [Authenticated], [UnAuthenticated], and [AuthLoading].
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
    // Registering event handlers to define the reactive behavior of the authentication system.
    on<CheckAuthEvent>(_onCheckAuthEvent);
    on<SignInEvent>(_onSignInEvent);
    on<SignOutEvent>(_onSignOutEvent);
  }

  /// Evaluates the existing authentication context to determine if a session is currently active.
  /// This handler is typically invoked during application initialization or app resume.
  Future<void> _onCheckAuthEvent(
    CheckAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthChecking());
    try {
      debugPrint('Validaing current authentication context...');
      final user = await _checkAuthStatus();

      if (user != null) {
        debugPrint('Active session identified for user: ${user.name}');
        emit(Authenticated(user));
      } else {
        debugPrint(
          'No active session found. Transitioning to unauthenticated state.',
        );
        emit(UnAuthenticated());
      }
    } catch (e) {
      debugPrint('An error occurred during authentication verification: $e');
      emit(UnAuthenticated());
    }
  }

  /// Processes a sign-in request by validating credentials and establishing a new session.
  /// This handler coordinates the transition from [AuthLoading] to either
  /// [Authenticated] or [AuthError] based on the outcome of the sign-in process.
  Future<void> _onSignInEvent(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      debugPrint('Initiating sign-in process for user: ${event.email}');
      final user = await _signInWaiter(event.email, event.password);

      if (user != null) {
        debugPrint('Sign-in successful. Welcome, ${user.name}.');
        emit(Authenticated(user));
      } else {
        debugPrint(
          'Sign-in failed: Invalid credentials or unauthorized access.',
        );
        emit(
          AuthError(
            'Failed to sign in. Please verify your credentials and try again.',
          ),
        );
      }
    } catch (e) {
      debugPrint('Sign-in process encountered a critical error: $e');

      // Sanitizing error messages to ensure they are user-friendly yet informative.
      String errorMessage = e.toString();
      if (errorMessage.startsWith('Exception: ')) {
        errorMessage = errorMessage.replaceFirst('Exception: ', '');
      }
      emit(AuthError(errorMessage));
    }
  }

  /// Gracefully terminates the current authentication session and resets the system state.
  /// Upon successful logout, the portal transitions back to the unauthenticated view.
  Future<void> _onSignOutEvent(
    SignOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      debugPrint('Executing secure sign-out procedure.');
      await _signOutWaiter();
      debugPrint('Sign-out completed. Session destroyed.');
      emit(UnAuthenticated());
    } catch (e) {
      debugPrint('Sign-out procedure failed: $e');
      emit(AuthError('An error occurred while signing out. Please try again.'));
    }
  }
}
