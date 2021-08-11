import 'dart:convert';

import 'package:demo3/model/shortAnswer.dart';

import 'answer.dart';

class Question {
  int questionId;
  String title;
  int difficulty;
  int courseId;
  int timelimit;
  int weight;
  String questionType;
  bool examOnly;
  String content;
  String explanation;
  String comment;
  int addedBy;
  bool inQuestionBank;
  String status;
  String? correctAnswerText;
  String? incorrectAnswerText;
  bool caseSensitive;
  int created;
  int modified;
  int timestamp;
  List<Answer>? multipleAnswers;
  List<ShortAnswer>? shortAnswers;

  Question({
    required this.questionId,
    required this.title,
    required this.difficulty,
    required this.courseId,
    required this.timelimit,
    required this.weight,
    required this.questionType,
    required this.examOnly,
    required this.content,
    required this.explanation,
    required this.comment,
    required this.addedBy,
    required this.inQuestionBank,
    required this.status,
    this.correctAnswerText,
    this.incorrectAnswerText,
    required this.caseSensitive,
    required this.created,
    required this.modified,
    required this.timestamp,
    this.multipleAnswers,
    this.shortAnswers,
  });

  factory Question.fromJson(dynamic json) {
    dynamic questionId = json["id"];
    dynamic title = json["title"];
    dynamic difficulty = json["difficulty"];
    dynamic courseId = json["course_id"];
    dynamic timelimit = json["timelimit"];
    dynamic weight = json["weight"];
    dynamic questionType = json["question_type"];
    dynamic examOnly = json["exam_only"];
    dynamic content = json["content"];
    dynamic explanation = json["explanations"];
    dynamic comment = json["comment"];
    dynamic addedBy = json["added_by"];
    dynamic inQuestionBank = json["in_question_bank"];
    dynamic correctAnswerText = json["correct_answer_text"];
    dynamic incorrectAnswerText = json["incorrect_answer_text"];

    dynamic status = json["status"];
    dynamic caseSensitive = json["case_sensitive"];
    dynamic modified = json["modified"];
    dynamic created = json["created"];
    dynamic timestamp = json["timestamp"];
    List<Answer> answers = [];
    List<ShortAnswer> shortAnswers = [];

    if (json['choices'] != null) {
      var groupObjJson = json['choices'] as List;
      answers = groupObjJson.map((groupJson) => Answer.fromJson(groupJson)).toList();
    } else if (json['accepted_answers'] != null) {
      var groupObjJson = json['accepted_answers'] as List;
      shortAnswers = groupObjJson.map((groupJson) => ShortAnswer.fromJson(groupJson)).toList();
    }
    return Question(
        questionId: questionId,
        title: title,
        difficulty: difficulty,
        courseId: courseId,
        timelimit: timelimit,
        weight: weight,
        questionType: questionType,
        examOnly: examOnly,
        content: content,
        explanation: explanation,
        comment: comment,
        addedBy: addedBy,
        inQuestionBank: inQuestionBank,
        status: status,
        correctAnswerText: correctAnswerText,
        incorrectAnswerText: incorrectAnswerText,
        caseSensitive: caseSensitive,
        created: created,
        modified: modified,
        timestamp: timestamp,
        multipleAnswers: answers,
        shortAnswers: shortAnswers);
  }
}
