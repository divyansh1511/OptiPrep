import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optiprep/topics/screens/company_problem_screen.dart';

class CompanyCardWidget extends StatelessWidget {
  final String title;
  final Color color_;
  // final String logoUrl; // URL of the company's logo

  const CompanyCardWidget(this.title, this.color_, {Key? key})
      : super(key: key);

  Widget _dialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        "${title}",
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      content: Text(
        "This is the problem set specially designed for the ${title}. Are you ready to proceed?",
        style: TextStyle(fontSize: 16.0, color: Colors.black54),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CompanyProblemListScreen(title)));
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
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => _scaleDialog(context),
        child: Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: color_,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color_, Colors.white],
                stops: [0.5, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            height: 200,
            width: 230,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Montserrat', // Use a creative font
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    width: 100,
                    height: 3,
                    color: Colors.black, // Add a separator line
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'This is an informative card that looks attractive.\nClick to explore!',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
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
