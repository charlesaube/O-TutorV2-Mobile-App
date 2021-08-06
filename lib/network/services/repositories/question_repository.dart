import 'dart:convert';
import 'dart:io';

import 'package:demo3/model/question.dart';
import 'package:demo3/network/api_client.dart';
import 'package:demo3/network/services/IQuestion_repository.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';
import 'package:http/http.dart' as http;

import '../../api_exceptions.dart';

class QuestionRepository extends IQuestionRepository {
  ApiClient _helper = new ApiClient();

  @override
  Future<List<Question>> fetchQuestionByQuizId(int id) async {
    http.Response response;
    var responseJson;
    try {
      response = await http.get(Uri.parse("http://8g9dz.mocklab.io/quizzes/12/questions"));
      responseJson = json.decode(response.body.toString());
    } on SocketException catch (e) {
      print(e);
      throw FetchDataException('No internet');
    }
    print(responseJson);
    //final response = await _helper.get("quizzes/" + id.toString() + "/questions");
    List<Question> questions = responseJson.map((groupJson) => Question.fromJson(groupJson)).toList();
    return questions;
  }
}
