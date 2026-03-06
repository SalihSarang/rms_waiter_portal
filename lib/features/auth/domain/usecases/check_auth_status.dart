import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import '../repositories/auth_repository.dart';

/// The [CheckAuthStatus] usecase is responsible for verifying the current
/// state of authentication within the application.
/// It interacts with the [AuthRepository] to determine if a valid
/// waiter session is presently established.
class CheckAuthStatus {
  final AuthRepository repository;

  CheckAuthStatus(this.repository);

  /// Executes the authentication check sequence.
  /// Returns a [StaffModel] if a session exists, otherwise returns null.
  Future<StaffModel?> call() async {
    return await repository.getCurrentWaiter();
  }
}
