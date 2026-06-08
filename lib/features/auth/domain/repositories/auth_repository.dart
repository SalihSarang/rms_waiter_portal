import 'package:rms_shared_package/rms_shared_package.dart';

abstract class AuthRepository {
  Future<StaffModel?> signIn(String email, String password);
  Future<void> signOut();
  Future<StaffModel?> getCurrentWaiter();
  Stream<StaffModel?> watchWaiterStatus(String uid);
  Future<void> updateLastActiveStatus(String uid, DateTime time);
}
