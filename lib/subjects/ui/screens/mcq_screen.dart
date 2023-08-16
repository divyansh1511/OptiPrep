import 'dart:async';

import 'package:flutter/material.dart';
import 'package:optiprep/subjects/ui/screens/result_screen.dart';
import '../../../core/Inherited_Widget_uid.dart';
import '../../api/mcq_problem_class.dart';

class MCQScreen extends StatefulWidget {
  List<MCQProblem> listneeded;
  String title;
  MCQScreen({super.key, required this.listneeded, required this.title});
  @override
  _MCQScreenState createState() => _MCQScreenState();
}

class _MCQScreenState extends State<MCQScreen> {
  late String userId;
  late List<MCQProblem> _problemList;
  Timer? _timer;
  int _remainingTime = 90;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer?.cancel();
          _proceedToNextQuestion();
        }
      });
    });
  }

  void _proceedToNextQuestion() {
    setState(() {
      _remainingTime = 90;
      if (currentProblemIndex < _problemList.length - 1) {
        currentProblemIndex++;
        _startTimer();
      } else {
        _timer?.cancel();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MyInheritedWidget(
              uid: userId,
              child: ResultScreen(
                score: no_of_correct_problems,
                totalproblems: _problemList.length,
                quizname: widget.title,
              ),
            ),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _problemList = widget.listneeded;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  int currentProblemIndex = 0;
  int no_of_correct_problems = 0;

  @override
  Widget build(BuildContext context) {
    MyInheritedWidget? userData = MyInheritedWidget.of(context);
    String tmp = userData!.uid;
    userId = tmp;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        // elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Welcome to ${widget.title} Quiz'),
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
            Expanded(
              child: ListView.builder(
                itemCount: _problemList.length,
                itemBuilder: (context, index) {
                  return _buildMCQProblemCard(_problemList[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Time Remaining: $_remainingTime seconds',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Your Score is ${no_of_correct_problems} / ${_problemList.length} , Attempted Problems ${currentProblemIndex}',
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMCQProblemCard(MCQProblem problem) {
    void _showResultDialog(String message) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Result'),
            content: Text(message),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _proceedToNextQuestion();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }

    if (_problemList.indexOf(problem) != currentProblemIndex) {
      return SizedBox.shrink();
    }

    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${currentProblemIndex + 1}. ${problem.statement}",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Column(
              children: problem.options
                  .asMap()
                  .entries
                  .map((entry) => RadioListTile<int>(
                        title: Text(entry.value),
                        value: entry.key,
                        groupValue: problem.selectedOptionIndex,
                        onChanged: (value) {
                          setState(() {
                            problem.selectedOptionIndex = value!;
                          });
                        },
                      ))
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Do something with the selected option, e.g., check the answer
                    // You can access the selected option using problem.selectedOptionIndex
                    if (problem.selectedOptionIndex ==
                        problem.correctOptionIndex) {
                      no_of_correct_problems++;
                      _showResultDialog('Correct!');
                    } else {
                      _showResultDialog(
                          'Wrong! The correct answer is: ${problem.options[problem.correctOptionIndex]}');
                    }
                    print('Selected Option: ${problem.selectedOptionIndex}');
                    _timer?.cancel();
                  },
                  child: Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Do something with the selected option, e.g., check the answer
                    // You can access the selected option using problem.selectedOptionIndex
                    _timer?.cancel();
                    _proceedToNextQuestion();
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
