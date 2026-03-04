import '../repositories/auth_repository.dart';

class SignOutWaiter {
  final AuthRepository repository;

  SignOutWaiter(this.repository);

  Future<void> call() async {
    return await repository.signOut();
  }
}
