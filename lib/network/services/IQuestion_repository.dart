import 'package:demo3/model/question.dart';

abstract class IQuestionRepository {
  fetchQuestionByQuizId(int id);
}