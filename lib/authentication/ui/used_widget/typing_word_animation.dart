import 'dart:async';

import 'package:flutter/material.dart';

class TypingAnimation extends StatefulWidget {
  final String text;
  final Duration animationDuration;
  final double size;
  final bool boldornot;
  final Color font_color;

  TypingAnimation(
      {required this.text,
      required this.size,
      required this.boldornot,
      required this.font_color,
      this.animationDuration = const Duration(milliseconds: 100)});

  @override
  _TypingAnimationState createState() => _TypingAnimationState();
}

class _TypingAnimationState extends State<TypingAnimation> {
  late Timer _timer;
  String _revealedText = '';

  @override
  void initState() {
    super.initState();
    _startTypingAnimation();
  }

  void _startTypingAnimation() {
    int currentIndex = 0;
    _timer = Timer.periodic(widget.animationDuration, (timer) {
      if (currentIndex < widget.text.length) {
        setState(() {
          _revealedText = widget.text.substring(0, currentIndex + 1);
          currentIndex++;
        });
      } else {
        timer.cancel(); // Animation finished, cancel the timer
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _revealedText,
      style: TextStyle(
          fontSize: widget.size,
          fontWeight: widget.boldornot ? FontWeight.bold : FontWeight.normal,
          color: widget.font_color),
    );
  }
}
