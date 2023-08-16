import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreProfileServices {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // This method returns the complete info about the user
  //
  // After passing the unique id for the user.

  static getUser(uid) {
    return firestore
        .collection("users")
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  // This method updates the password for the user
  //
  // For Authentication as well as in database.

  static changeAuthPassword({email, password, newpassword, uid}) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(email: email, password: password);

    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser.updatePassword(newpassword);
    }).catchError((error) {
      print(error.toString());
    });
    await FirebaseFirestore.instance.collection('users').doc(uid).set(
      {
        'password': newpassword,
      },
      SetOptions(merge: true),
    );
  }

  // This method is to update the user details
  // Mobile Number and Name
  // using uid

  static UpdateUserValue({name, phone_number, uid}) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set(
      {
        'name': name,
        'phone_number': phone_number,
      },
      SetOptions(merge: true),
    );
  }

  // The method is to get the current user out of the app.

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signOut() async {
    await _auth.signOut();
    // User signed out successfully
  }
}
