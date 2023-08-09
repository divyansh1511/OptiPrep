import 'package:flutter/material.dart';

class CustomPopupWidget extends StatefulWidget {
  final String title;

  const CustomPopupWidget({Key? key, required this.title}) : super(key: key);

  @override
  _CustomPopupWidgetState createState() => _CustomPopupWidgetState();
}

class _CustomPopupWidgetState extends State<CustomPopupWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, -1.5), // Start off-screen
      end: Offset.zero, // End at center
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 100),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Advisory!!',
                    style: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                      'You should have a good grip on basics of data structure for attempting the problem set for ${widget.title}.'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
