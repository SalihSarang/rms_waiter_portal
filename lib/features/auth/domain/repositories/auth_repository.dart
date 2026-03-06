import 'package:rms_shared_package/models/staff_model/staff_model.dart';

abstract class AuthRepository {
  Future<StaffModel?> signIn(String email, String password);
  Future<void> signOut();
  Future<StaffModel?> getCurrentWaiter();
  Future<void> updateLastActiveStatus(String uid, DateTime time);
}
