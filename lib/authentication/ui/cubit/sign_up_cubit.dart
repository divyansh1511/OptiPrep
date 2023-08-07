import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optiprep/authentication/api/sign_up_interactor.dart';
import 'package:optiprep/authentication/ui/cubit/sign_up_state.dart';
import '../../impl/firebase_authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../di/authentication_di.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  SignUpCubit() : super(SignUpInitialState());

  Future<void> signUp(
      String email, String password, String name, String phone_number) async {
    try {
      emit(SignUpLoadingState());
      final interactor =
          AuthenticationDi().getValue('signup') as SignUpInteractor;
      bool tmp = await interactor.signup(email, password, name, phone_number);
      if (tmp == false) {
        emit(SignUpErrorState("error_msg"));
      }
      User? user = _auth.currentUser;
      emit(SignUpSuccessState("${user!.uid}"));
      // return user;
      // User signed up successfully

      // Store additional user data in the Realtime Database
      // DatabaseReference userRef =
      //     FirebaseDatabase.instance.ref().child('users').child(user!.uid);
      // userRef.set({
      //   'name': name,
      //   'phone_number': phoneNumber,
      //   'email': email,
      //   'password': password,
      // });
    } catch (e) {
      // Handle sign up failure
      print(e.toString());
      emit(SignUpErrorState(e.toString()));
    }
  }

  void storeUserData(
      String name, String password, String email, String phoneNumber) async {}
}
