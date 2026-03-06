import '../repositories/auth_repository.dart';

/// The [UpdateLastActiveUseCase] is designed to synchronize the
/// waiter's temporal activity state with the backend.
/// This ensures the system maintains an accurate record of the
/// waiter's operational availability.
class UpdateLastActiveUseCase {
  final AuthRepository repository;

  UpdateLastActiveUseCase(this.repository);

  /// Dispatches an update request for the waiter's 'lastActive' timestamp.
  Future<void> call(String uid, DateTime time) async {
    return await repository.updateLastActiveStatus(uid, time);
  }
}
