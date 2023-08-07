import 'package:optiprep/core/parent_interactor.dart';

abstract class SignUpInteractor extends ParentInteractor {
  Future<bool> signup(
      String email, String pasword, String name, String phone_number);
}
