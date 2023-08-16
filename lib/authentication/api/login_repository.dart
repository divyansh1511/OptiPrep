import '../../core/parent_repository.dart';

abstract class LoginRepository extends ParentRepository {
  Future<bool> loggingUsingEmailPassword(String email, String password);
}
