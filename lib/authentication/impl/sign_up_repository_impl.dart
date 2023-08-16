import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:optiprep/authentication/api/sign_up_repository.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // This method creates a new entity to the database for new users
  //
  // This method initiates all the fields which could further be used by the
  // user like profile picture and scores.

  Future<bool> signupWithDetails(
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
