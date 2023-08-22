import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:optiprep/authentication/api/login_interactor.dart';
import 'package:optiprep/authentication/impl/login_interactor_impl.dart';
import 'package:optiprep/authentication/ui/cubit/login_cubit.dart';
import 'package:optiprep/authentication/ui/cubit/login_state.dart';
import 'package:optiprep/authentication/ui/di/authentication_di.dart';
import 'package:optiprep/core/parent_interactor.dart'; // Import your dependencies

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockParentInteractor extends Mock implements LoginInteractor {}

// class LoginCubit extends Cubit<LoginStates> {
//   final FirebaseAuth _auth;
//   final MockLoginInteractor _loginInteractor;
//
//   LoginCubit(this._auth, this._loginInteractor) : super(LoginInitialState());
// }

void main() {
  group('LoginCubit', () {
    late LoginCubit loginCubit;
    late MockFirebaseAuth mockFirebaseAuth;
    late MockParentInteractor mockParentInteractor;

    setUpAll(() {
      mockFirebaseAuth = MockFirebaseAuth();
      mockParentInteractor = MockParentInteractor();
      loginCubit = LoginCubit();
    });

    // tearDown(() {
    //   loginCubit.close();
    // });

    test('initial state is LoginInitialState', () {
      // print('Initial state: ${loginCubit.state}');
      expect(loginCubit.state, isA<LoginInitialState>());
    });

    test('loading and successful state', () async {
      bool tmp = await loginCubit.login('hhh@gmail.com', 'Divi12@');

      // Verify emitted states
      print(loginCubit.state);
      expectLater(loginCubit.state, isA<LoginStates>());

      // expect(tmp, true);
    });
  });
}

// class MockUser extends Mock implements User {
//   MockUser({required this.uid});
//   @override
//   final String uid;
// }
