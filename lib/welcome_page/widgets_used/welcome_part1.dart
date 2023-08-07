import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:optiprep/about_page/ui/about_page.dart';
import 'package:optiprep/authentication/ui/screens/login_page.dart';
import 'package:optiprep/authentication/ui/screens/sign_up_page.dart';
import 'package:optiprep/welcome_page/widgets_used/arrow_animation.dart';
import 'package:optiprep/welcome_page/widgets_used/bouncing_image.dart';
import 'background_container.dart';

class WelcomePagePart1 extends StatelessWidget {
  const WelcomePagePart1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const IconData myIcon = Icons.arrow_forward;
    return Stack(
      children: [
        ClipPath(
          clipper: TrapeziumClipper(),
          child: Container(
            color: Colors.black,
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      height: 100,
                      width: 100,
                      // color: Colors.red,
                      child: Image(
                        image: AssetImage(
                          'assets/logo.png',
                        ),
                      ),
                    ),
                    const Text(
                      "OptiPrep",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    const Spacer(),
                    AnimatedButton(
                      width: 80,
                      height: 30,
                      text: 'Login',
                      backgroundColor: Colors.black,
                      selectedBackgroundColor:
                          const Color.fromRGBO(0, 128, 128, 1),
                      animatedOn: AnimatedOn.onHover,
                      selectedTextColor: Colors.white,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      textStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Ace your way to success...",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "A platform to enhance your skill and knowledge.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ArrowAnimation(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedButton(
                      width: 350,
                      height: 60,
                      text: "Get Your Account",
                      // "Get Your Account ${String.fromCharCode(myIcon.codePoint)}",
                      backgroundColor: Colors.black,
                      selectedBackgroundColor:
                          const Color.fromRGBO(0, 128, 128, 1),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 250,
            ),
            Row(
              children: [
                const BouncingImage(image_path: "assets/welcome1.png"),
                const Spacer(),
                Column(
                  children: [
                    const SizedBox(
                      height: 140,
                    ),
                    const Text(
                      "Wanna know more about us?",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AnimatedButton(
                      width: 400,
                      height: 40,
                      text: "Here you go",
                      // "Get Your Account ${String.fromCharCode(myIcon.codePoint)}",
                      backgroundColor: Colors.transparent,
                      selectedBackgroundColor: Colors.black,
                      animatedOn: AnimatedOn.onHover,
                      selectedTextColor: Colors.white,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      textStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      borderRadius: 50,
                      borderColor: Colors.white,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutPage()));
                      },
                    ),
                  ],
                ),
                const Spacer(),
                const BouncingImage(image_path: "assets/welcome2.png"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
