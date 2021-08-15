import 'package:demo3/model/quiz_attempt.dart';

abstract class IQuizRepository {
  fetchQuizByGroupId(int groupId);
  fetchQuizById(int id);
  createQuizAttempt(int quizId, int attemptDate);
}
