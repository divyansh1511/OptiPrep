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
