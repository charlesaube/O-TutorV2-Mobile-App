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
  Future<Quiz> fetchQuizById(int id) async {
    http.Response response;
    var responseJson;
    try {
      response = await http.get(Uri.parse("http://8g9dz.mocklab.io/quiz/2"));
      responseJson = _helper.returnResponse(response);
    } on SocketException catch (e) {
      print(e);
      throw FetchDataException('No internet');
    }
    print("FetchQuizId response:");
    print(responseJson);
    Quiz quiz = Quiz.fromJson(responseJson);

    return quiz;
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

  @override
  Future<String> saveQuizAttempt(QuizAttempt quizAttempt) async {
    http.Response response;
    var responseJson;
    Map<String, dynamic> qa = {
      "id": 23,
      "quiz_id": 145,
      "duration": "12:34",
      "is_over": false,
      "current_question_id": 26,
      "questions_order": [23, 24, 25, 12, 45, 21],
      "question_attempts": [
        {
          "question_id": 23,
          "is_answer": 0,
          "obtained_mark": 2,
          "good_answer": true,
          "answer_time": 12,
          "type": "multiplechoice",
          "answers": [243, 245]
        },
        {
          "question_id": 24,
          "is_answer": 0,
          "answer_time": 14,
          "obtained_mark": 0,
          "good_answer": false,
          "type": "shortanswer",
          "answer": "cat"
        },
        {
          "question_id": 25,
          "is_answer": 0,
          "answer_time": 44,
          "obtained_mark": 1,
          "good_answer": true,
          "type": "multiplechoice",
          "answers": [250]
        }
      ]
    };
    Map<String, dynamic> body = quizAttempt.toJson();
    print(body);
    try {
      response = await http.post(Uri.parse("http://8g9dz.mocklab.io/saveQuizAttempt/12"), body: jsonEncode(qa));
      responseJson = _helper.returnResponse(response);
    } on SocketException catch (e) {
      print(e);
      throw FetchDataException('No internet');
    }
    print(responseJson['message']);
    return responseJson['message'];
  }

  @override
  Future<List<QuizAttempt>> getQuizAttemptsOfUser() async {
    http.Response response;
    var responseJson;
    try {
      response = await http.get(
        Uri.parse("http://8g9dz.mocklab.io/quiz_attempts"),
      );
      responseJson = _helper.returnResponse(response);
    } on SocketException catch (e) {
      print(e);
      print(responseJson);
      throw FetchDataException('No internet');
    }
    var quizObjJson = responseJson as List;
    List<QuizAttempt> quizAttempts =
        List<QuizAttempt>.from(quizObjJson.map((quizJson) => QuizAttempt.fromJson(quizJson)));
    print(quizAttempts);
    return quizAttempts;
  }
}
