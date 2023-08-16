import 'package:firebase_auth/firebase_auth.dart';
import 'package:optiprep/authentication/api/login_repository.dart';
import 'package:optiprep/authentication/impl/login_repository_impl.dart';
import 'package:optiprep/authentication/ui/di/authentication_di.dart';

import '../api/login_interactor.dart';
import '../ui/cubit/login_state.dart';

class LoginInteractorImpl extends LoginInteractor {
  @override
  Future<bool> login(String email, String password) async {
    final loginrepo =
        AuthenticationDi().getValueRepo('loginRepo') as LoginRepository;

    return await loginrepo.logging_using_email_pass(email, password);
  }
}
