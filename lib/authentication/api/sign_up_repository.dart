import 'package:optiprep/core/parent_repository.dart';

abstract class SignUpRepository extends ParentRepository {
  Future<bool> signupWithDetails(
      String email, String password, String name, String phone_number);
}
