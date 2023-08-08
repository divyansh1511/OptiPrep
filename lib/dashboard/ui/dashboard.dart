import 'package:flutter/material.dart';
import 'package:optiprep/blogs/ui/medium_blog.dart';
import 'package:optiprep/dashboard/ui/widgets_used/card_widget.dart';
import 'package:optiprep/dashboard/ui/widgets_used/company_card_widget.dart';
import 'package:optiprep/dashboard/ui/widgets_used/subject_card_widget.dart';
import 'package:optiprep/profile/ui/profile_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/Inherited_Widget_uid.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    MyInheritedWidget? userData = MyInheritedWidget.of(context);
    String tmp = userData!.uid;

    String url = "https://medium.com/@divyansh_garg";
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        // elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Your Dashboard",
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyInheritedWidget(
                        uid: tmp, child: const ProfileScreen())));
              },
              child: const Icon(Icons.account_circle_outlined),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
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
              GestureDetector(
                onTap: () {
                  launch(url, forceSafariVC: false, forceWebView: false);
                },
                child: Transform.translate(
                  offset: const Offset(0, -5),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF64B5F6), // Light Blue
                              Color(0xFF1976D2), // Dark Blue
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey.withOpacity(0.5),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Hey!! Did you check our blog page? , Check Here!!",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    "Core Subjects",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    SubjectCardWidget("Operating System", Colors.greenAccent,
                        "assets/card3.jpg", tmp),
                    SubjectCardWidget(
                        "DBMS", Colors.amberAccent, "assets/card2.jpg", tmp),
                    SubjectCardWidget(
                        "OOPS", Colors.tealAccent, "assets/card1.jpg", tmp),
                    SubjectCardWidget("System Design", Colors.blueAccent,
                        "assets/card2.jpg", tmp),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Text(
                      "Choose Your Topic",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    SizedBox(
                      width: 30,
                    ),
                    CardWidget("Arrays", Colors.amber,
                        "An array is a data structure consisting of a collection of elements, of same memory size, each identified by at least one array index or key."),
                    CardWidget("Strings", Colors.blueAccent,
                        "A string is generally considered as a data type and is often implemented as an array data structure of bytes (or words) that stores a sequence of elements, typically characters, using some character encoding."),
                    CardWidget("Linked List", Colors.green,
                        "A linked list consists of a data element known as a node. And each node consists of two fields: one field has data, and in the second field, the node has an address that keeps a reference to the next node."),
                    CardWidget("Stacks & Queues", Colors.cyan,
                        "A stack follows a LIFO (Last In First Out) order, whereas a queue follows a FIFO (First In First Out) order for storing the elements. A stack uses one end known as a top for insertion and deletion whereas a queue uses two ends front and rear for insertion and deletion."),
                    CardWidget("Trees", Colors.orange,
                        "A tree is a hierarchical data structure defined as a collection of nodes. Nodes represent value and nodes are connected by edges. A tree has the following properties: The tree has one node called root."),
                    CardWidget("Dynamic Programing", Colors.pinkAccent,
                        "Dynamic programming (usually referred to as DP ) is a very powerful technique to solve a particular class of problems. It demands very elegant formulation of the approach and simple thinking and the coding part is very easy."),
                    CardWidget("Graphs", Colors.redAccent,
                        "A graph is a non-linear kind of data structure made up of nodes or vertices and edges. The edges connect any two nodes in the graph, and the nodes are also known as vertices."),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Text(
                      "Company wise problem list",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    SizedBox(
                      width: 30,
                    ),
                    CompanyCardWidget("Google", Colors.deepOrangeAccent),
                    CompanyCardWidget("Amazon", Colors.grey),
                    CompanyCardWidget("Microsoft", Colors.brown),
                    CompanyCardWidget("Adobe", Colors.red),
                    CompanyCardWidget("IBM", Colors.blue),
                    CompanyCardWidget("Gojek", Colors.green),
                    CompanyCardWidget("Zomato", Colors.redAccent),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) => MediumBlogsScreen()));
              //   },
              //   child: const Text("Get to the blogs"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
