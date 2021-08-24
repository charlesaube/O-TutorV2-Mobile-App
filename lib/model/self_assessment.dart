import 'dart:convert';

import 'package:demo3/model/question.dart';

import 'question_attempt.dart';

class SelfAssessment {
  int id;
  int courseId;
  List<int> topics;
  String duration;
  String timelimit;
  bool isOver;
  int totalQuestions;
  int currentQuestionId;
  List<QuestionAttempt> questionAttempts;
  List<Question> questions;

  SelfAssessment(
      {required this.id,
      required this.courseId,
      required this.topics,
      required this.duration,
      required this.timelimit,
      required this.isOver,
      required this.totalQuestions,
      required this.currentQuestionId,
      required this.questionAttempts,
      required this.questions});

  factory SelfAssessment.fromJson(dynamic json) {
    int id = json["id"];
    dynamic courseId = json["course_id"];

    var topicObjJson = json['topics'].cast<int>();
    print(topicObjJson);
    List<int> topics = List<int>.from(topicObjJson);
    dynamic duration = json["duration"];
    dynamic timelimit = json["timelimit"];
    dynamic isOver = json["is_over"];
    dynamic totalQuestions = json["total_questions"];
    dynamic currentQuestionId = json["current_question_id"];

    var questionAttemptObjJson = json['question_attempts'] as List;
    List<QuestionAttempt> questionAttempts =
        List<QuestionAttempt>.from(questionAttemptObjJson.map((groupJson) => QuestionAttempt.fromJson(groupJson)));
    questionAttemptObjJson = json['questions'] as List;
    List<Question> questions =
        List<Question>.from(questionAttemptObjJson.map((groupJson) => Question.fromJson(groupJson)));

    return SelfAssessment(
        id: id,
        courseId: courseId,
        topics: topics,
        duration: duration,
        timelimit: timelimit,
        isOver: isOver,
        totalQuestions: totalQuestions,
        currentQuestionId: currentQuestionId,
        questionAttempts: questionAttempts,
        questions: questions);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'course_id:': courseId,
        'topics:': topics,
        'duration': duration,
        'is_over': isOver,
        'total_questions': totalQuestions,
        'current_question_id': currentQuestionId,
        'question_attempts': jsonEncode(questionAttempts),
      };
}
