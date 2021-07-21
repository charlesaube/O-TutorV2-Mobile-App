import 'package:demo3/model/question.dart';
import 'package:demo3/network/api_client.dart';
import 'package:demo3/network/services/IQuestion_repository.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';

class QuestionRepository extends IQuestionRepository{

  ApiClient _helper = new ApiClient();

  @override
  Future<Question> fetchQuestionByQuizId(int id) async {
    final response = await _helper.get("quizzes/" + id.toString() + "/questions");
    return Question.fromJson(response);
  }



}