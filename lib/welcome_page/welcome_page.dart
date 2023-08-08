import 'package:flutter/material.dart';
import 'package:optiprep/welcome_page/widgets_used/welcome_mobile_ui.dart';
import 'package:optiprep/welcome_page/widgets_used/welcome_part1.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromRGBO(0, 128, 128, 1),
        child: kIsWeb ? const WelcomePagePart1() : const WelcomeMobilePage(),
      ),
    );
  }
}
