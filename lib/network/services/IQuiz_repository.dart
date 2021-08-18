import 'package:demo3/model/quiz_attempt.dart';

abstract class IQuizRepository {
  fetchQuizByGroupId(int groupId);
  fetchQuizById(int id);
  Future<QuizAttempt> createQuizAttempt(Map<String, int> body);
  Future<String> saveQuizAttempt(QuizAttempt quizAttempt);
}
