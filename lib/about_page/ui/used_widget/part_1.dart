import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:optiprep/welcome_page/widgets_used/bouncing_image.dart';

class AboutPagePart1 extends StatelessWidget {
  final bool isImageVisible;
  final String title;
  final String Subtitle;

  const AboutPagePart1(
      {Key? key,
      required this.isImageVisible,
      required this.title,
      required this.Subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double scwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        if (scwidth > 600)
          Expanded(
            flex: 1,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 800),
              opacity: isImageVisible ? 1.0 : 0.0,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1.0, 0.0),
                  end: isImageVisible ? Offset(0.0, 0.0) : Offset(-1.0, 0.0),
                ).animate(CurvedAnimation(
                  parent: ModalRoute.of(context)!.animation!,
                  curve: Interval(0.3, 1.0, curve: Curves.easeIn),
                )),
                child: Container(
                  color: Colors.teal,
                  width: 200, // Adjust width to your requirement
                  height: MediaQuery.of(context)
                      .size
                      .height, // Adjust height to your requirement
                  child: const BouncingImage(image_path: "assets/content.png"),
                ),
              ),
            ),
          ),
        Expanded(
          flex: 1,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 800),
            opacity: isImageVisible ? 1.0 : 0.0,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: isImageVisible ? Offset(0.0, 0.0) : Offset(1.0, 0.0),
              ).animate(CurvedAnimation(
                parent: ModalRoute.of(context)!.animation!,
                curve: Interval(0.3, 1.0, curve: Curves.easeIn),
              )),
              child: Container(
                color: Colors.white,
                width: 200, // Adjust width to your requirement
                height: MediaQuery.of(context)
                    .size
                    .height, // Adjust height to your requirement
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${title}",
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text(
                          "${Subtitle}",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
