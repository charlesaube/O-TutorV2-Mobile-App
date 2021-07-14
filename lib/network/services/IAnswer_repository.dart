import 'package:demo3/model/Answer.dart';

abstract class IAnswerRepository {
  fetchAnswerByQuestionId(int id);

}