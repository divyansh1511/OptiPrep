import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optiprep/Open%20Ai%20chat/chat_body.dart';
import 'package:optiprep/about_page/ui/used_widget/part_1.dart';
import 'package:optiprep/about_page/ui/used_widget/part_2.dart';
import 'package:optiprep/about_page/ui/used_widget/part_3.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  ScrollController _scrollController = ScrollController();
  bool _isImageVisible = false;
  bool _isImageVisible_2 = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    double scrollPosition = _scrollController.position.pixels;
    double threshold = 200.0;
    bool isVisible =
        scrollPosition > threshold && scrollPosition < 7 * threshold;
    bool isVisible2 = scrollPosition > 5 * threshold;

    if (isVisible != _isImageVisible || isVisible2 != _isImageVisible_2) {
      setState(() {
        _isImageVisible = isVisible;
        _isImageVisible_2 = isVisible2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Know About Us!",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color.fromRGBO(0, 128, 128, 1), Colors.black],
                  stops: [0.0, 1.0],
                ),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Here are things provided by us...",
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _scrollController.animateTo(
                          740,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      });
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: const Icon(
                      Icons.arrow_downward_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: AboutPagePart1(
                isImageVisible: _isImageVisible,
                title: "A New Way to Learn",
                Subtitle:
                    "OptiPrep is the best platform to help you enhance your skills, expand your knowledge and prepare for technical interviews.",
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: AboutPagePart2(
                isImageVisible: _isImageVisible_2,
                title: "Prepare for MNC's",
                Subtitle:
                    "Explore is a well-organized tool that helps you get the most out of LeetCode by providing structure to guide your progress towards the next step in your programming career.",
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const AboutPagePart3(),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Made with love!!",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "At OptiPrep, our mission is to help you improve yourself and land your dream job. We have a sizable repository of interview resources for many companies.",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Copyright @2023 OptiPrep",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Help Center"),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black),
                              ),
                              const Text(
                                "  |  ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Privacy Policy"),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black),
                              ),
                              const Text(
                                "  |  ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Bug Report"),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black),
                              ),
                              const Text(
                                "  |  ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const ChatPage()));
                                },
                                child: Text("Check Api"),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
