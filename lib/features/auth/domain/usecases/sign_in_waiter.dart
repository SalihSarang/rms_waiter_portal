import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import '../repositories/auth_repository.dart';

/// The [SignInWaiter] usecase encapsulates the logic for initiating
/// a new authenticated session for a waiter.
/// It coordinates with the [AuthRepository] to validate credentials
/// and retrieve the waiter's profile upon success.
class SignInWaiter {
  final AuthRepository repository;

  SignInWaiter(this.repository);

  /// Executes the sign-in procedure with the provided credentials.
  /// Returns the authenticated [StaffModel] or null if sign-in fails.
  Future<StaffModel?> call(String email, String password) async {
    return await repository.signIn(email, password);
  }
}
