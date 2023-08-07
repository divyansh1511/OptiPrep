import 'package:firebase_auth/firebase_auth.dart';

import '../api/login_interactor.dart';
import '../ui/cubit/login_state.dart';

class LoginInteractorImpl extends LoginInteractor {
  @override
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }
}
