import 'package:demo3/model/question.dart';

abstract class IQuestionRepository {
  Future<List<Question>>  fetchQuestionByQuizId(int id);
}