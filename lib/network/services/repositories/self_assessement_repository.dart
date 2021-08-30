import 'dart:convert';
import 'dart:io';

import 'package:demo3/model/self_assessment.dart';
import 'package:demo3/network/services/ISelf_assessments_repository.dart';
import 'package:http/http.dart' as http;

import '../../api_client.dart';
import '../../api_exceptions.dart';

class SelfAssessmentRepository implements ISelfAssessmentsRepository {
  ApiClient _helper = new ApiClient();

  @override
  Future<SelfAssessment> createSelfAssesment(Map<String, dynamic> body) async {
    http.Response response;
    var responseJson;
    try {
      response = await http.post(Uri.parse("http://8g9dz.mocklab.io/self-assessments"), body: jsonEncode(body));
      responseJson = _helper.returnResponse(response);
    } on SocketException catch (e) {
      print(e);
      throw FetchDataException('No internet');
    }
    print("create self assessment response:");
    print(responseJson);
    SelfAssessment selfAssessment = SelfAssessment.fromJson(responseJson);

    return selfAssessment;
  }

  @override
  Future<String> saveSelfAssesment(SelfAssessment selfAssessment) async {
    http.Response response;
    var responseJson;

    Map<String, dynamic> body = selfAssessment.toJson();
    body = {
      "id": 23,
      "course_id": 34,
      "topics": [45, 67],
      "timelimit": "15:00",
      "duration": "12:34",
      "is_over": false,
      "total_questions": 23,
      "current_question_id": 26,
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
    print(body);

    try {
      response = await http.post(Uri.parse("http://8g9dz.mocklab.io/self-assessment/14"), body: jsonEncode(body));
      responseJson = _helper.returnResponse(response);
    } on SocketException catch (e) {
      print(e);
      throw FetchDataException('No internet');
    }
    print(responseJson);

    return responseJson['message'];
  }
}
