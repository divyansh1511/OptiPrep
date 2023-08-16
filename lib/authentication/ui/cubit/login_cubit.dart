import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optiprep/authentication/api/login_interactor.dart';
import 'package:optiprep/authentication/impl/firebase_authentication.dart';
import 'package:optiprep/authentication/ui/di/authentication_di.dart';
import 'package:optiprep/core/parent_interactor.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  final FirebaseAuth _auth;
  // final ParentInteractor _parentInteractor;

  LoginCubit(this._auth) : super(LoginInitialState());

  Future<bool> login(String email, String password) async {
    try {
      emit(LoginLoadingState());
      // final interactor = _parentInteractor as LoginInteractor;
      final interactor =
          AuthenticationDi().getValue('login') as LoginInteractor;
      bool tmp = await interactor.login(email, password);
      if (tmp) {
        emit(LoginErrorState("error_msg"));
      }
      User? user = _auth.currentUser;
      emit(LoginSuccessState("${user!.uid}"));
      // User signed in successfully
    } catch (e) {
      // Handle sign in failure
      print(e.toString());
      emit(LoginErrorState(e.toString()));
      return false;
    }
    return true;
  }
}
