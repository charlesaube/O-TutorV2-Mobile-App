import 'package:demo3/model/quiz.dart';
import 'package:demo3/network/api_client.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';

class QuizRepository extends IQuizRepository{
  ApiClient _helper = new ApiClient();

  @override
  fetchQuizByCategoryName(String categoryName) async {
    final response = await _helper.get("");
    throw UnimplementedError();
  }

  @override
  fetchQuizByCategoryId(int categoryId) async{
    final response = await _helper.get("/" + categoryId.toString() + "/");
  }

  @override
  fetchQuizById(int id) async{
    final response = await _helper.get("question/" + id.toString() + "/");
    return Quiz.fromJson(response);
  }

}