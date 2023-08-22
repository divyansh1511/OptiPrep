import 'package:optiprep/authentication/api/sign_up_interactor.dart';
import 'package:optiprep/authentication/impl/login_repository_impl.dart';
import 'package:optiprep/authentication/impl/sign_up_interactor_impl.dart';
import 'package:optiprep/authentication/impl/sign_up_repository_impl.dart';
import 'package:optiprep/core/parent_interactor.dart';
import 'package:optiprep/subjects/impl/firebase/test_repository_impl.dart';
import 'package:optiprep/subjects/ui/di/test_di.dart';

import '../../../core/parent_repository.dart';
import '../../api/login_interactor.dart';
import '../../api/login_repository.dart';
import '../../impl/login_interactor_impl.dart';

// class AuthenticationDi {
//   static final Map<String, dynamic> value = {};
//
//   static void setValue(ParentInteractor interactor, String key) {
//     value[key] = interactor;
//   }
//
//   ParentInteractor getValue(String key) {
//     return value[key];
//   }
//
//   static void setValueRepo(ParentRepository repository, String key) {
//     value[key] = repository;
//   }
//
//   ParentRepository getValueRepo(String key) {
//     return value[key];
//   }
// }

class AuthenticationDi {
  static final AuthenticationDi _instance = AuthenticationDi._();

  factory AuthenticationDi() {
    return _instance;
  }

  AuthenticationDi._(); // Private constructor

  final Map<String, dynamic> value = {};

  void setValue(ParentInteractor interactor, String key) {
    value[key] = interactor;
  }

  ParentInteractor getValue(String key) {
    return value[key];
  }

  void setValueRepo(ParentRepository repository, String key) {
    value[key] = repository;
  }

  ParentRepository getValueRepo(String key) {
    return value[key];
  }
}

void initializer() {
  final authenticationDi = AuthenticationDi();

  authenticationDi.setValue(LoginInteractorImpl(), 'login');
  authenticationDi.setValue(SignUpInteractorImpl(), 'signup');
  authenticationDi.setValueRepo(LoginRepositoryImpl(), 'loginRepo');
  authenticationDi.setValueRepo(SignUpRepositoryImpl(), 'signupRepo');
  TestDi.setValue(TestRepositoryImpl(), 'StoreScore');
}
