import '../../core/parent_repository.dart';

abstract class LoginRepository extends ParentRepository {
  Future<bool> logging_using_email_pass(String email, String password);
}
