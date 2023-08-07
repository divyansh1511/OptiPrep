import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

// Future<void> signUpWithEmailAndPassword(
//     String email, String password, String name, String phoneNumber) async {
//   try {
//     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//
//     User? user = userCredential.user;
//     // return user;
//     // User signed up successfully
//
//     // Store additional user data in the Realtime Database
//     // DatabaseReference userRef =
//     //     FirebaseDatabase.instance.ref().child('users').child(user!.uid);
//     // userRef.set({
//     //   'name': name,
//     //   'phone_number': phoneNumber,
//     //   'email': email,
//     //   'password': password,
//     // });
//   } catch (e) {
//     // Handle sign up failure
//     print(e.toString());
//   }
// }

// Future<void> signInWithEmailAndPassword(String email, String password) async {
//   try {
//     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     User? user = userCredential.user;
//     // User signed in successfully
//   } catch (e) {
//     // Handle sign in failure
//     print(e.toString());
//   }
// }

void signOut() async {
  await _auth.signOut();
  // User signed out successfully
}
