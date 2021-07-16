import 'package:demo3/model/Category.dart';
import 'package:demo3/model/quiz.dart';

abstract class IQuizRepository {

  fetchQuizByCategoryName(String categoryName);
  fetchQuizByCategoryId(int categoryId);
  fetchQuizById(int id);

}