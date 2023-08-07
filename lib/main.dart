import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:optiprep/authentication/ui/di/authentication_di.dart';
import 'package:optiprep/welcome_page/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyCAtKJ9IBNCrcGkna0JccduqtSzyHB0lrM",
    projectId: "optiprep-a1b58",
    messagingSenderId: "1003070183939",
    appId: "1:1003070183939:web:ae8cdd4cdf186b4244cc36",
    storageBucket: "optiprep-a1b58.appspot.com",
  ));
  initializer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OptiPrep',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomePage(),
      // home: ResultScreen(score: 10, totalproblems: 20),
    );
  }
}
