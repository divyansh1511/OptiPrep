import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

import '../../about_page/ui/about_page.dart';
import '../../authentication/ui/screens/login_page.dart';
import '../../authentication/ui/screens/sign_up_page.dart';
import 'background_container.dart';

class WelcomeMobilePage extends StatelessWidget {
  const WelcomeMobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: TrapeziumClipper(),
          child: Container(
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 100,
                      width: 80,
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
                    const SizedBox(
                      width: 100,
                    ),
                    AnimatedButton(
                      width: 50,
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
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Ace your way to success...",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "A platform to enhance your skill and knowledge.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 400,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedButton(
                    width: 320,
                    height: 60,
                    text: "Get Your Account",
                    // "Get Your Account ${String.fromCharCode(myIcon.codePoint)}",
                    backgroundColor: Colors.transparent,
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
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              height: 540,
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutPage()));
              },
            ),
          ],
        ),
      ],
    );
  }
}
