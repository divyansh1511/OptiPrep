import 'package:flutter/material.dart';

class ColoredCard extends StatefulWidget {
  Color color;
  String text;
  ColoredCard({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  State<ColoredCard> createState() => _ColoredCardState();
}

class _ColoredCardState extends State<ColoredCard> {
  bool _isHovering = false;

  void _updateHovering(bool isHovering) {
    setState(() {
      _isHovering = isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _updateHovering(true),
      onExit: (_) => _updateHovering(false),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: 200,
          width: 350,
          decoration: BoxDecoration(
            color: _isHovering ? widget.color.withOpacity(0.9) : widget.color,
            borderRadius: BorderRadius.circular(16),
            boxShadow: _isHovering
                ? [
                    BoxShadow(
                      color: widget.color.withOpacity(0.6),
                      offset: Offset(0, 6),
                      blurRadius: 12,
                    ),
                  ]
                : [],
          ),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
