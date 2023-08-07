import 'package:cloud_firestore/cloud_firestore.dart';

void storeQuizScore(
    String userId, String quizName, int score, int totalProblem) {
  // Reference to the user's document in the "users" collection
  final userRef = FirebaseFirestore.instance.collection('users').doc(userId);

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
