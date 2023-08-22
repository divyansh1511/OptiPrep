import 'package:flutter/material.dart';
import 'package:optiprep/welcome_page/welcome_page.dart';

class AnimatedLinesScreen extends StatefulWidget {
  @override
  _AnimatedLinesScreenState createState() => _AnimatedLinesScreenState();
}

class _AnimatedLinesScreenState extends State<AnimatedLinesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Define a list of colors for the lines
  List<Color> lineColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..forward().whenComplete(() {
        // After the animation completes, navigate to the next screen
        Future.delayed(Duration(seconds: 2), () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const WelcomePage()), // Replace with your next screen
          );
        });
      });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Reset the animation to play again
        _controller.repeat();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < lineColors.length; i++)
                  _buildBouncingLine(
                    _controller,
                    index: i,
                    color: lineColors[i],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBouncingLine(AnimationController controller,
      {required int index, required Color color}) {
    final double lineHeight = 50;
    final double delayFactor = 0.2;

    final Animation<double> animation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 1)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 1,
      ),
    ]).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(index * delayFactor, (index + 1) * delayFactor),
    ));

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          width: 3,
          height: lineHeight,
          color: color,
          margin: EdgeInsets.symmetric(horizontal: 2),
          transform: Matrix4.translationValues(
            0.0,
            -lineHeight * animation.value,
            0.0,
          ),
        );
      },
    );
  }
}
