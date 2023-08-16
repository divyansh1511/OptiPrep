import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optiprep/authentication/api/login_interactor.dart';
import 'package:optiprep/authentication/impl/login_interactor_impl.dart';
import 'package:optiprep/authentication/ui/cubit/login_cubit.dart';
import 'package:optiprep/authentication/ui/screens/sign_up_page.dart';
import 'package:optiprep/authentication/ui/used_widget/slide_transition.dart';
import 'package:optiprep/authentication/ui/used_widget/text_form_widget.dart';
import 'package:optiprep/authentication/ui/used_widget/typing_word_animation.dart';
import 'package:optiprep/core/Inherited_Widget_uid.dart';
import 'package:optiprep/dashboard/ui/dashboard.dart';

import '../../../welcome_page/widgets_used/bouncing_image.dart';
import '../cubit/login_state.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController reset_email_controller = TextEditingController();

  Future<void> _resetPassword() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      final String email = reset_email_controller.text.trim();
      await _auth.sendPasswordResetEmail(email: email);
      // Show a success message or navigate to a confirmation screen
    } catch (e) {
      // Handle any errors (e.g., email not found, network error)
      print('Error resetting password: $e');
    }
  }

  void showTopSlideDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Send the request for password change",
                    style: TextStyle(fontSize: 30, color: Colors.teal),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  CustomTextFormField(
                      labelText: "Email Address",
                      controller_: reset_email_controller),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel")),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal),
                        onPressed: () {
                          _resetPassword();
                          Navigator.of(context).pop();
                        },
                        child: const Text("Submit"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(FirebaseAuth.instance),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              // print(state.uid_pss);
              // print("hello");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyInheritedWidget(
                      uid: state.uid_pss, child: const DashboardPage()),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoginLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoginSuccessState) {
              return const SizedBox.shrink();
            } else if (state is LoginErrorState) {
              return Center(
                child: Text(state.error_msg),
              );
            } else {
              // double screenwidth = MediaQuery.of(context).size.width;
              return Row(
                children: [
                  if (kIsWeb)
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: const Color.fromRGBO(0, 128, 128, 1),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                AnimatedButton(
                                  width: 120,
                                  height: 40,
                                  text: "Sign Up",
                                  // "Get Your Account ${String.fromCharCode(myIcon.codePoint)}",
                                  backgroundColor:
                                      const Color.fromRGBO(0, 128, 128, 1),
                                  selectedBackgroundColor: Colors.black,
                                  animatedOn: AnimatedOn.onHover,
                                  selectedTextColor: Colors.white,
                                  transitionType: TransitionType.LEFT_TO_RIGHT,
                                  textStyle: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                  ),
                                  // borderColor: const Color.fromRGBO(0, 128, 128, 1),
                                  onPress: () {
                                    Navigator.push(
                                      context,
                                      SlideLeftRoute(
                                        page: const SignUpPage(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const BouncingImage(
                                image_path: "assets/signup.png"),
                          ],
                        ),
                      ),
                    ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      "Welcome Back!",
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 128, 128, 1),
                                        fontSize: 60,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  TypingAnimation(
                                    text: "Get to your account...",
                                    size: 30,
                                    boldornot: false,
                                    font_color: Colors.black,
                                  ),
                                  // Text(
                                  //   "Get to your account...",
                                  //   style: TextStyle(
                                  //     color: Colors.black,
                                  //     fontSize: 30,
                                  //   ),
                                  // ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              CustomTextFormField(
                                  labelText: "Email Address",
                                  controller_: email_controller),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextFormField(
                                  labelText: "Password",
                                  controller_: password_controller),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AnimatedButton(
                                    width: 250,
                                    height: 30,
                                    text: "Forgot Password?",
                                    backgroundColor:
                                        const Color.fromRGBO(0, 128, 128, 1),
                                    selectedBackgroundColor: Colors.black,
                                    animatedOn: AnimatedOn.onHover,
                                    selectedTextColor: Colors.white,
                                    transitionType:
                                        TransitionType.LEFT_TO_RIGHT,
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                    onPress: () {
                                      showTopSlideDialog(context);
                                    },
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: AnimatedButton(
                                      width: 350,
                                      height: 60,
                                      text: "Log In",
                                      // "Get Your Account ${String.fromCharCode(myIcon.codePoint)}",
                                      backgroundColor:
                                          const Color.fromRGBO(0, 128, 128, 1),
                                      selectedBackgroundColor: Colors.black,
                                      animatedOn: AnimatedOn.onHover,
                                      selectedTextColor: Colors.white,
                                      transitionType:
                                          TransitionType.LEFT_TO_RIGHT,
                                      textStyle: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                      borderWidth: 2,
                                      borderRadius: 50,
                                      borderColor: Colors.white,
                                      onPress: () {
                                        if (_formKey.currentState!.validate()) {
                                          final cubit =
                                              context.read<LoginCubit>();
                                          cubit.login(email_controller.text,
                                              password_controller.text);
                                        }
                                      },
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (!kIsWeb)
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      SlideLeftRoute(
                                        page: const SignUpPage(),
                                      ),
                                    );
                                  },
                                  child: const Text("Create a new account?"),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
