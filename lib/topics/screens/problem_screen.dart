import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../api/services.dart';
import '../used_widgets/url_button.dart';

class ProblemListScreen extends StatefulWidget {
  final String topic_;
  const ProblemListScreen(this.topic_, {Key? key}) : super(key: key);

  @override
  _ProblemListScreenState createState() => _ProblemListScreenState();
}

class _ProblemListScreenState extends State<ProblemListScreen> {
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
            Icon(Icons.account_circle_outlined),
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
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Text(
                      widget.topic_,
                      style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  )
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
                    "Companies",
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
            ProblemListWidget(widget.topic_),
          ],
        ),
      ),
    );
  }
}

class Problem {
  final String category;
  final List<String> companyNames;
  final String link;
  final String name;

  Problem(this.category, this.companyNames, this.link, this.name);
}

class ProblemListWidget extends StatelessWidget {
  final String category;

  ProblemListWidget(this.category);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FireStoreServices.getProblems(category),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Problem> problems = snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            String category = data['p_category'];
            List<String> companyNames =
                List<String>.from(data['p_company'] ?? []);
            String link = data['p_link'] ?? "";
            String name = data['p_name'] ?? "";
            // print(link);
            // print(name);
            return Problem(category, companyNames, link, name);
          }).toList();

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Use horizontal scrolling
            child: Column(
              children: problems
                  .map((problem) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.grey[300],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  '${problem.name}',
                                ),
                              ),
                              // const SizedBox(
                              //   width: 50,
                              // ),
                              Expanded(
                                flex: 1,
                                child: Text('${problem.category}'),
                              ),
                              // const SizedBox(
                              //   width: 50,
                              // ),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    '${problem.companyNames.join(", ")}',
                                  )),
                              // const SizedBox(
                              //   width: 40,
                              // ),
                              // Text('${problem.link}'),
                              Expanded(
                                flex: 1,
                                child: WebsiteButton(problem.link),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
