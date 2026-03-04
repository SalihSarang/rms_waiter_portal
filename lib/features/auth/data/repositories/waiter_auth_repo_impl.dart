import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/waiter_auth_remote_datasource.dart';

class WaiterAuthRepoImpl implements AuthRepository {
  final WaiterAuthRemoteDataSource remoteDataSource;

  WaiterAuthRepoImpl({required this.remoteDataSource});

  @override
  Future<StaffModel?> getCurrentWaiter() async {
    try {
      return await remoteDataSource.getCurrentWaiter();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StaffModel?> signIn(String email, String password) async {
    try {
      return await remoteDataSource.signIn(email, password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await remoteDataSource.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
