import '../repositories/auth_repository.dart';

/// The [SignOutWaiter] usecase handles the secure termination of
/// the current waiter's authentication session.
/// It ensures that all session-related data is cleared via the [AuthRepository].
class SignOutWaiter {
  final AuthRepository repository;

  SignOutWaiter(this.repository);

  /// Executes the sign-out sequence to invalidate the current session.
  Future<void> call() async {
    return await repository.signOut();
  }
}
