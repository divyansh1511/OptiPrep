import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:optiprep/authentication/api/sign_up_repository.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> signup_with_details(
      String email, String password, String name, String phone_number) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      DocumentReference store =
          await firestore.collection("users").doc(user!.uid);
      store.set({
        'name': name,
        'password': password,
        'email': email,
        'phone_number': phone_number,
        'id': user.uid,
        'profilePicture': "",
        'scores': [],
      });
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }
}
