import 'package:optiprep/core/parent_interactor.dart';

abstract class LoginInteractor extends ParentInteractor {
  Future<bool> login(String email, String password);
}
