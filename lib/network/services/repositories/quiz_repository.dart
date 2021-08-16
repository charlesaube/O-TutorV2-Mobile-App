import 'dart:convert';
import 'dart:io';

import 'package:demo3/model/quiz.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:demo3/network/api_client.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../api_exceptions.dart';

class QuizRepository extends IQuizRepository {
  ApiClient _helper = new ApiClient();

  @override
  fetchQuizByGroupId(int groupId) async {
    final response = await _helper.get("groups/" + groupId.toString() + "/quizzes");
    var quizObjJson = response as List;
    List<Quiz> quizzes = quizObjJson.map((quizJson) => Quiz.fromJson(quizJson)).toList();
    return quizzes;
  }

  @override
  fetchQuizById(int id) {
    // TODO: implement fetchQuizById
    throw UnimplementedError();
  }

  @override
  Future<QuizAttempt> createQuizAttempt(Map<String, int> body) async {
    http.Response response;
    var responseJson;
    print(body);
    try {
      response = await http.post(Uri.parse("http://8g9dz.mocklab.io/quiz_attempts"), body: jsonEncode(body));
      responseJson = _helper.returnResponse(response);
    } on SocketException catch (e) {
      print(e);
      throw FetchDataException('No internet');
    }
    print(responseJson);
    QuizAttempt quizAttempt = QuizAttempt.fromJson(responseJson);

    return quizAttempt;
  }
}
