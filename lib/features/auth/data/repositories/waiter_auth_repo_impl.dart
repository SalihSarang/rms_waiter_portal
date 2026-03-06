import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/waiter_auth_remote_datasource.dart';

/// The [WaiterAuthRepoImpl] serves as the concrete implementation of the [AuthRepository].
/// It acts as a mediator between the domain layer and the remote data source,
/// facilitating the flow of authentication data and ensuring robust error handling across boundaries.
class WaiterAuthRepoImpl implements AuthRepository {
  final WaiterAuthRemoteDataSource remoteDataSource;

  WaiterAuthRepoImpl({required this.remoteDataSource});

  @override
  Future<StaffModel?> getCurrentWaiter() async {
    try {
      // Orchestrates the retrieval of the currently active waiter session.
      return await remoteDataSource.getCurrentWaiter();
    } catch (e) {
      // Propagation of exceptions to the domain layer for higher-level handling.
      rethrow;
    }
  }

  @override
  Future<StaffModel?> signIn(String email, String password) async {
    try {
      // Initiates the remote sign-in sequence via the designated data source.
      return await remoteDataSource.signIn(email, password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      // Coordinates the global sign-out procedure to invalidate the current session.
      await remoteDataSource.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateLastActiveStatus(String uid, DateTime time) async {
    try {
      // Synchronizes the waiter's temporal activity state with the remote backend.
      await remoteDataSource.updateLastActiveStatus(uid, time);
    } catch (e) {
      rethrow;
    }
  }
}
