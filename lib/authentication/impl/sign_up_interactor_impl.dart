import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:optiprep/authentication/api/sign_up_interactor.dart';
import 'package:optiprep/authentication/api/sign_up_repository.dart';
import 'package:optiprep/authentication/ui/di/authentication_di.dart';

class SignUpInteractorImpl extends SignUpInteractor {
  @override
  Future<bool> signup(
      String email, String password, String name, String phone_number) async {
    final _signUpInteractor =
        AuthenticationDi().getValueRepo('signupRepo') as SignUpRepository;

    return await _signUpInteractor.signup_with_details(
        email, password, name, phone_number);
  }
}
