import 'package:demo3/model/Category.dart';
import 'package:demo3/model/quiz.dart';

abstract class IQuizRepository {

  fetchQuizByCategory(String categoryName);
   fetchQuizById(int id);

}