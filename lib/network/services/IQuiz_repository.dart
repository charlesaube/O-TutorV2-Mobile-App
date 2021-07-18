import 'package:demo3/model/Category.dart';
import 'package:demo3/model/quiz.dart';

abstract class IQuizRepository {

  fetchQuizByGroupId(int groupId);
  fetchQuizById(int id);

}