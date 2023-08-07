import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optiprep/authentication/ui/cubit/sign_up_cubit.dart';
import 'package:optiprep/authentication/ui/cubit/sign_up_state.dart';
import 'package:optiprep/authentication/ui/screens/login_page.dart';
import 'package:optiprep/authentication/ui/used_widget/text_form_widget.dart';
import 'package:optiprep/core/Inherited_Widget_uid.dart';
import 'package:optiprep/dashboard/ui/dashboard.dart';
import 'package:optiprep/welcome_page/widgets_used/bouncing_image.dart';

import '../used_widget/slide_transition.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController phone_number_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController repeat_password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        body: BlocConsumer<SignUpCubit, SignUpStates>(
          listener: (context, state) {
            if (state is SignUpSuccessState) {
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
            if (state is SignUpLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SignUpSuccessState) {
              return const SizedBox.shrink();
            } else if (state is SignUpErrorState) {
              return Center(
                child: Text(state.error_msg),
              );
            } else {
              double screenwidth = MediaQuery.of(context).size.width;
              return Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    "Welcome!",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 60,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    "Please provide the below details",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(0, 128, 128, 1),
                                    ),
                                  ),
                                ],
                              ),
                              CustomTextFormField(
                                  labelText: "Your Name",
                                  controller_: name_controller),
                              CustomTextFormField(
                                  labelText: "Email Address",
                                  controller_: email_controller),
                              CustomTextFormField(
                                  labelText: "Phone Number",
                                  controller_: phone_number_controller),
                              CustomTextFormField(
                                  labelText: "Password",
                                  controller_: password_controller),
                              CustomTextFormField(
                                  labelText: "Confirm Password",
                                  controller_: repeat_password_controller),
                              const SizedBox(
                                height: 15,
                              ),
                              AnimatedButton(
                                width: 350,
                                height: 60,
                                text: "Create Account",
                                // "Get Your Account ${String.fromCharCode(myIcon.codePoint)}",
                                backgroundColor:
                                    const Color.fromRGBO(0, 128, 128, 1),
                                selectedBackgroundColor: Colors.black,
                                animatedOn: AnimatedOn.onHover,
                                selectedTextColor: Colors.white,
                                transitionType: TransitionType.LEFT_TO_RIGHT,
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                borderWidth: 2,
                                borderRadius: 50,
                                borderColor: Colors.white,
                                onPress: () {
                                  if (password_controller.text ==
                                      repeat_password_controller.text) {
                                    final cubit = context.read<SignUpCubit>();
                                    cubit.signUp(
                                        email_controller.text,
                                        password_controller.text,
                                        name_controller.text,
                                        phone_number_controller.text);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Please check your details.")));
                                  }
                                },
                              ),
                              if (screenwidth < 600)
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        SlideRightRoute(
                                            page: const LoginPage()));
                                  },
                                  child: Text("Already Have an account?"),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (screenwidth > 600)
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AnimatedButton(
                                  width: 120,
                                  height: 40,
                                  text: "Login",
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
                                        SlideRightRoute(
                                            page: const LoginPage()));
                                  },
                                ),
                                const SizedBox(
                                  width: 20,
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
                    )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
