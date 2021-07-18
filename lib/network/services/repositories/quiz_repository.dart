import 'package:demo3/model/quiz.dart';
import 'package:demo3/network/api_client.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';

class QuizRepository extends IQuizRepository{
  ApiClient _helper = new ApiClient();


  @override
  fetchQuizByGroupId(int groupId) async {
    final response = await _helper.get("groups/" + groupId.toString() +"/quizzes");
    var quizObjJson = response  as List;
    List<Quiz> quizzes = quizObjJson.map((quizJson) => Quiz.fromJson(quizJson)).toList();
    return quizzes;
  }

  @override
  fetchQuizById(int id) {
    // TODO: implement fetchQuizById
    throw UnimplementedError();
  }



}