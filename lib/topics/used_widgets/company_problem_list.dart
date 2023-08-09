import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:optiprep/topics/used_widgets/url_button.dart';

import '../api/services.dart';

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
