import 'package:flutter/material.dart';
import '../used_widgets/company_problem_list.dart';
import '../used_widgets/company_screen_popup.dart';

class CompanyProblemListScreen extends StatefulWidget {
  final String topic_;
  const CompanyProblemListScreen(this.topic_, {Key? key}) : super(key: key);

  @override
  _ProblemListScreenState createState() => _ProblemListScreenState();
}

class _ProblemListScreenState extends State<CompanyProblemListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Hey User!",
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromRGBO(0, 128, 128, 1), Colors.black],
            stops: [0.0, 1.0],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomPopupWidget(title: widget.topic_);
                          });
                    },
                    child: Text(
                      widget.topic_,
                      style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                SizedBox(
                  width: 40,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Problems",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white70,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Category",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white70,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Link",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white70,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            // CompanyProblemListScreen(widget.topic_),
            CompanyProblemListWidget(widget.topic_),
          ],
        ),
      ),
    );
  }
}
