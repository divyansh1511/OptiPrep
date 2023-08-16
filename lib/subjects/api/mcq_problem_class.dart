// This is format for the MCQ cards screen in UI
// Every MCQ problem is the below format

// note that indexing start from zero

class MCQProblem {
  String statement;
  List<String> options;
  int selectedOptionIndex;
  int correctOptionIndex;

  MCQProblem({
    required this.statement,
    required this.options,
    this.selectedOptionIndex = -1,
    required this.correctOptionIndex,
  });
}
