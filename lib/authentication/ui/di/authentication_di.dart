import 'package:optiprep/authentication/api/sign_up_interactor.dart';
import 'package:optiprep/authentication/impl/sign_up_interactor_impl.dart';
import 'package:optiprep/core/parent_interactor.dart';

import '../../api/login_interactor.dart';
import '../../impl/login_interactor_impl.dart';

class AuthenticationDi {
  static final Map<String, dynamic> value = {};

  // static void setValue(LoginInteractor loginInteractor, String key) {
  //   value[key] = loginInteractor;
  // }
  //
  // static void setValueSignup(SignUpInteractor signUpInteractor, String key) {
  //   value[key] = signUpInteractor;
  // }
  //
  // LoginInteractor getValue(String key) {
  //   return value[key];
  // }
  //
  // SignUpInteractor getvalueSignup(String key) {
  //   return value[key];
  // }

  static void setValue(ParentInteractor interactor, String key) {
    value[key] = interactor;
  }

  ParentInteractor getValue(String key) {
    return value[key];
  }
}

void initializer() {
  AuthenticationDi.setValue(LoginInteractorImpl(), 'login');
  AuthenticationDi.setValue(SignUpInteractorImpl(), 'signup');
}
