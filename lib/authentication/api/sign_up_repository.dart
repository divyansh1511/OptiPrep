import 'package:optiprep/core/parent_repository.dart';

abstract class SignUpRepository extends ParentRepository {
  Future<bool> signup_with_details(
      String email, String password, String name, String phone_number);
}
