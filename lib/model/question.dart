import 'dart:convert';

import 'package:demo3/model/shortAnswer.dart';

import 'answer.dart';

class Question {
  int questionId;
  String title;
  int difficulty;
  int courseId;
  int timelimite;
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
  int timeStamp;
  List<Answer>? answers;

  Question({
    required this.questionId,
    required this.title,
    required this.difficulty,
    required this.courseId,
    required this.timelimite,
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
    required this.timeStamp,
    this.answers,
  });

  factory Question.fromJson(dynamic json) {
    dynamic questionId = json["id"];
    dynamic title = json["title"];
    dynamic difficulty = json["difficulty"];
    dynamic courseId = json["course_id"];
    dynamic timelimite = json["timelimite"];
    dynamic weight = json["weight"];
    dynamic questionType = json["question_type"];
    dynamic examOnly = json["exam_only"];
    dynamic content = json["content"];
    dynamic explanation = json["explanation"];
    dynamic comment = json["comment"];
    dynamic addedBy = json["addedBy"];
    dynamic inQuestionBank = json["in_question_bank"];
    dynamic status = json["status"];
    dynamic caseSensitive = json["caseSensitive"];
    dynamic modified = json["modified"];
    dynamic created = json["created"];

    dynamic timeStamp = json["timeStamp"];
    dynamic answers;

    if (json['choices'] != null) {
      var groupObjJson = json['choices'] as List;
      List<Answer> answers = groupObjJson.map((groupJson) => Answer.fromJson(groupJson)).toList();
    } else if (json['accepted_answers'] != null) {
      var groupObjJson = json['accepted_answers'] as List;
      List<ShortAnswer> answers = groupObjJson.map((groupJson) => ShortAnswer.fromJson(groupJson)).toList();
    }
    return Question(
        questionId: questionId,
        title: title,
        difficulty: difficulty,
        courseId: courseId,
        timelimite: timelimite,
        weight: weight,
        questionType: questionType,
        examOnly: examOnly,
        content: content,
        explanation: explanation,
        comment: comment,
        addedBy: addedBy,
        inQuestionBank: inQuestionBank,
        status: status,
        caseSensitive: caseSensitive,
        created: created,
        modified: modified,
        timeStamp: timeStamp,
        answers: answers);
  }
}
