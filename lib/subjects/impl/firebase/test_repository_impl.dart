import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:optiprep/subjects/api/test_repository.dart';

class TestRepositoryImpl extends TestRepository {
  @override
  void storeQuizScore(
      String userId, String quizName, int score, int totalProblem) {
    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);

    // This method updates your score in firebase
    // It store data in the form of array
    // each single entity is a Map : Strings , number , number

    userRef.update({
      'quiz_scores': FieldValue.arrayUnion([
        {'quiz_name': quizName, 'score': score, 'total_problem': totalProblem},
      ]),
    }).then((_) {
      print('Quiz score stored successfully!');
    }).catchError((error) {
      print('Error storing quiz score: $error');
    });
  }
}
