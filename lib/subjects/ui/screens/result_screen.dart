import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:optiprep/subjects/impl/firebase/test_interactor_impl.dart';

import '../../../core/Inherited_Widget_uid.dart';
import '../../impl/firebase/test_services.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class ResultScreen extends StatefulWidget {
  final int score;
  final int totalproblems;
  final String quizname;

  const ResultScreen(
      {Key? key,
      required this.score,
      required this.totalproblems,
      required this.quizname})
      : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 8));

  @override
  void initState() {
    super.initState();
    _showFireworks(); // Show fireworks animation when the screen is loaded
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _showFireworks() {
    _confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    MyInheritedWidget? userData = MyInheritedWidget.of(context);
    String UserId = userData!.uid;
    TestInteractorImpl().storeScore(
        UserId, widget.quizname, widget.score, widget.totalproblems);
    double scwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromRGBO(0, 128, 128, 1), Colors.black],
            stops: [0.0, 1.0],
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Text(
                    "Here's your Result for the test",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: Text(
                    "${widget.score} / ${widget.totalproblems}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            if (kIsWeb)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirection: -pi / 4, // Simulate gravity effect
                    emissionFrequency: 0.05,
                    numberOfParticles: 30,
                    colors: const [
                      Colors.red,
                      Colors.green,
                      Colors.blue,
                      Colors.yellow,
                    ],
                  ),
                  ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirection: -pi / 4, // Simulate gravity effect
                    emissionFrequency: 0.05,
                    numberOfParticles: 30,
                    colors: const [
                      Colors.red,
                      Colors.green,
                      Colors.blue,
                      Colors.yellow,
                    ],
                  ),
                  ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirection: -pi / 4, // Simulate gravity effect
                    emissionFrequency: 0.05,
                    numberOfParticles: 30,
                    colors: const [
                      Colors.red,
                      Colors.green,
                      Colors.blue,
                      Colors.yellow,
                    ],
                  ),
                  ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirection: -pi / 4, // Simulate gravity effect
                    emissionFrequency: 0.05,
                    numberOfParticles: 30,
                    colors: const [
                      Colors.red,
                      Colors.green,
                      Colors.blue,
                      Colors.yellow,
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
