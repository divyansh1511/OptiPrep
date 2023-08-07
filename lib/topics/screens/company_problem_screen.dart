import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../api/services.dart';
import '../used_widgets/url_button.dart';

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
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    widget.topic_,
                    style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
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

class CompanyProblem {
  final String category;
  // final List<String> companyNames;
  final String link;
  final String name;

  CompanyProblem(this.category, this.link, this.name);
}

class CompanyProblemListWidget extends StatelessWidget {
  final String category;

  CompanyProblemListWidget(this.category);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FireStoreServices.getCompanyWiseProblems(category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Stream is waiting for data
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Stream has encountered an error
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          // Stream has no data or empty data
          return Text('No data available.');
        } else {
          // Stream has data
          List<CompanyProblem> problems = snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            String category = data['p_category'];
            // List<String> companyNames =
            // List<String>.from(data['p_company'] ?? []);
            String link = data['p_link'] ?? "";
            String name = data['p_name'] ?? "";
            // print(link);
            // print(name);
            return CompanyProblem(category, link, name);
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
                            borderRadius: BorderRadius.circular(8.0),
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
                                  child: Text(
                                    '${problem.category}',
                                  )),
                              // const SizedBox(
                              //   width: 50,
                              // ),
                              // Text('${problem.companyNames.join(", ")}'),
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
        }
      },
    );
  }
}
