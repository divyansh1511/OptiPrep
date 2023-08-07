import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

import '../../../authentication/ui/screens/sign_up_page.dart';
import 'service_card.dart';

class AboutPagePart3 extends StatefulWidget {
  const AboutPagePart3({Key? key}) : super(key: key);

  @override
  _AboutPagePart3State createState() => _AboutPagePart3State();
}

class _AboutPagePart3State extends State<AboutPagePart3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Things we provide",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 100,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ColoredCard(color: Colors.teal, text: "Problems & Contests"),
              ColoredCard(
                  color: Colors.tealAccent, text: "Interview Preparation"),
              ColoredCard(
                  color: Colors.greenAccent, text: "Company-wise Preparation"),
            ],
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        AnimatedButton(
          width: 300,
          height: 40,
          text: "Lets Explore",
          // "Get Your Account ${String.fromCharCode(myIcon.codePoint)}",
          backgroundColor: const Color.fromRGBO(0, 128, 128, 1),
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
