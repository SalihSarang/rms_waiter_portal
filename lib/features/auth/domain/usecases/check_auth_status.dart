import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import '../repositories/auth_repository.dart';

class CheckAuthStatus {
  final AuthRepository repository;

  CheckAuthStatus(this.repository);

  Future<StaffModel?> call() async {
    return await repository.getCurrentWaiter();
  }
}
