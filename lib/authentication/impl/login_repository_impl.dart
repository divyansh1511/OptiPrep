import 'package:firebase_auth/firebase_auth.dart';
import 'package:optiprep/authentication/api/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> loggingUsingEmailPassword(String email, String password) async {
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
