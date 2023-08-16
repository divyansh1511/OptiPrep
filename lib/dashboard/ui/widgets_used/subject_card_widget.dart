import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optiprep/core/Inherited_Widget_uid.dart';
import 'package:optiprep/subjects/impl/lists/dbms_list.dart';
import 'package:optiprep/subjects/impl/lists/os_list.dart';
import 'package:optiprep/subjects/impl/lists/sd_list.dart';

import '../../../subjects/impl/lists/oops_list.dart';
import '../../../subjects/ui/screens/mcq_screen.dart';

// class SubjectCardWidget extends StatelessWidget {
//   final String title;
//   final Color color_;
//   final String image_;
//   const SubjectCardWidget(this.title, this.color_, this.image_, {Key? key})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: GestureDetector(
//         onTap: () {
//           if (title == "OOPS") {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => MCQScreen(
//                           listneeded: oopsList,
//                           title: title,
//                         )));
//           } else if (title == "Operating System") {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => MCQScreen(
//                           listneeded: osList,
//                           title: title,
//                         )));
//           } else if (title == "DBMS") {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => MCQScreen(
//                           listneeded: dbmsList,
//                           title: title,
//                         )));
//           } else {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => MCQScreen(
//                           listneeded: sdList,
//                           title: title,
//                         )));
//           }
//         },
//         child: SizedBox(
//           height: 150,
//           width: 300,
//           child: Card(
//             // Define the shape of the card
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(4),
//             ),
//             // Define how the card's content should be clipped
//             clipBehavior: Clip.antiAliasWithSaveLayer,
//             color: color_,
//             // Define the child widget of the card
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 // Add padding around the row widget
//                 Padding(
//                   padding: const EdgeInsets.all(15),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       // Add an image widget to display an image
//                       Image.asset(
//                         image_,
//                         height: 100,
//                         width: 100,
//                         fit: BoxFit.cover,
//                       ),
//                       // Add some spacing between the image and the text
//                       Container(width: 20),
//                       // Add an expanded widget to take up the remaining horizontal space
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             // Add some spacing between the top of the card and the title
//                             Container(height: 5),
//                             // Add a title widget
//                             Text(
//                               title,
//                               style: const TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             // Add some spacing between the title and the subtitle
//                             Container(height: 5),
//                             // Add a subtitle widget
//                             const Text(
//                               "Sub title",
//                               style: TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                             // Add some spacing between the subtitle and the text
//                             Container(height: 10),
//                             // Add a text widget to display some text
//                             Text(
//                               "sample text",
//                               maxLines: 2,
//                               style: TextStyle(
//                                 color: Colors.grey[700],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class SubjectCardWidget extends StatelessWidget {
  final String title;
  final Color color_;
  final String image_;
  final String userId;

  const SubjectCardWidget(this.title, this.color_, this.image_, this.userId,
      {Key? key})
      : super(key: key);

  Widget _dialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        "${title}",
        style: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      content: const Text(
        "Once You Start the quiz you can't return without completing.",
        style: TextStyle(fontSize: 16.0, color: Colors.black54),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (title == "OOPS") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyInheritedWidget(
                          uid: userId,
                          child: MCQScreen(
                            listneeded: oopsList,
                            title: title,
                          ))));
            } else if (title == "Operating System") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyInheritedWidget(
                          uid: userId,
                          child: MCQScreen(
                            listneeded: osList,
                            title: title,
                          ))));
            } else if (title == "DBMS") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyInheritedWidget(
                          uid: userId,
                          child: MCQScreen(
                            listneeded: dbmsList,
                            title: title,
                          ))));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyInheritedWidget(
                          uid: userId,
                          child: MCQScreen(
                            listneeded: sdList,
                            title: title,
                          ))));
            }
          },
          child: const Text(
            "Yes",
            style: TextStyle(color: Colors.red, fontSize: 17),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "No",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
      ],
    );
  }

  void _scaleDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: _dialog(ctx),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: 150,
          width: 300,
          child: Card(
            // Define the shape of the card
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            // Define how the card's content should be clipped
            clipBehavior: Clip.antiAliasWithSaveLayer,
            // Background image for the card with gradient overlay
            child: Stack(
              children: [
                Image.asset(
                  image_,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                // Gradient overlay to make text more readable
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.6)
                      ],
                    ),
                  ),
                ),
                // Content of the card
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Add some spacing between the top of the card and the title
                      const Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                      // Add a title widget with custom font
                      Expanded(
                        flex: 2,
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            fontFamily: 'Montserrat', // Use custom font
                          ),
                        ),
                      ),
                      // Add some spacing between the title and the button
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      // Add a button widget
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () {
                            _scaleDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Start Quiz",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
