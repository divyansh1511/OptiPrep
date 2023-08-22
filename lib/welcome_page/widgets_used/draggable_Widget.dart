import 'package:flutter/material.dart';

import '../welcome_page.dart';

class DraggableButton extends StatefulWidget {
  @override
  _DraggableButtonState createState() => _DraggableButtonState();
}

class _DraggableButtonState extends State<DraggableButton> {
  double _xOffset = 0;
  double _yOffset = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _xOffset += details.delta.dx;
          _yOffset += details.delta.dy;
        });
      },
      // onPanEnd: (details) {
      //   setState(() {
      //     _xOffset = 0;
      //     _yOffset = 0;
      //   });
      // },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: _xOffset,
            top: _yOffset,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Drag Me'),
            ),
          ),
        ],
      ),
    );
  }
}

class DraggableButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Button Screen'),
      ),
      body: Center(
        child: DraggableButton(),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: DraggableButtonScreen(),
//   ));
// }
