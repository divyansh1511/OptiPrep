import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:optiprep/topics/used_widgets/problem_screen_popup.dart';
import 'package:optiprep/topics/used_widgets/url_button.dart';

import '../api/services.dart';

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
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              // const SizedBox(
                              //   width: 50,
                              // ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  '${problem.category}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              // const SizedBox(
                              //   width: 50,
                              // ),
                              Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ProblemCustomPopupWidget(
                                                title:
                                                    '${problem.companyNames.join(", ")}');
                                          });
                                    },
                                    child: Text(
                                      '${problem.companyNames.join(", ")}',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
