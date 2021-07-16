import 'package:demo3/model/answer.dart';

abstract class IAnswerRepository {
  fetchAnswerByQuestionId(int id);

}