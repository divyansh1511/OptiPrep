import 'package:optiprep/subjects/api/test_interactor.dart';
import 'package:optiprep/subjects/ui/di/test_di.dart';

class TestInteractorImpl extends TestInteractor {
  @override
  void storeScore(String userId, String quizName, int score, int totalProblem) {
    final testRepo = TestDi().getValue("StoreScore");

    testRepo.storeQuizScore(userId, quizName, score, totalProblem);
  }
}
