import 'package:demo3/model/quiz.dart';
import 'package:demo3/network/api_client.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';

class QuizService extends IQuizRepository{

  ApiClient _helper = new ApiClient();

  List<Quiz> fetchQuizByCategoryName(String categoryName) {
    Quiz q1 = new Quiz.basic("Titre", 1);
    Quiz q2 = new Quiz.basic("Titre", 2);
    Quiz q3 = new Quiz.basic("Titre", 3);
    Quiz q4 = new Quiz.basic("Titre",4);

    List<Quiz> quizList = [];
    quizList.add(q1);
    quizList.add(q2);
    quizList.add(q3);
    quizList.add(q4);

    return quizList;
  }



  @override
  fetchQuizByCategoryId(int categoryId) async {
    final response = await _helper.get("/category/");
    return Quiz.fromJson(response);
  }

  @override
  fetchQuizByGroupId(int groupId) {
    // TODO: implement fetchquizByGroupId
    throw UnimplementedError();
  }

  @override
  fetchQuizById(int id) {
    // TODO: implement fetchQuizById
    throw UnimplementedError();
  }
}