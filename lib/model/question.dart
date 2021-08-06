import 'dart:convert';

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
  bool in_question_bank;
  String status;
  String? correctAnswerText;
  String? incorrectAnswerText;
  bool caseSensitive;
  int created;
  int modified;
  int timeStamp;
  List<Answer> answers;

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
    required this.in_question_bank,
    required this.status,
    this.correctAnswerText,
    this.incorrectAnswerText,
    required this.caseSensitive,
    required this.created,
    required this.modified,
    required this.timeStamp,
    required this.answers,
  });

  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'title': title,
      'difficulty': difficulty,
      'courseId': courseId,
      'timelimite': timelimite,
      'weight': weight,
      'questionType': questionType,
      'examOnly': examOnly,
      'content': content,
      'explanation': explanation,
      'comment': comment,
      'addedBy': addedBy,
      'in_question_bank': in_question_bank,
      'status': status,
      'correctAnswerText': correctAnswerText,
      'incorrectAnswerText': incorrectAnswerText,
      'caseSensitive': caseSensitive,
      'created': created,
      'modified': modified,
      'timeStamp': timeStamp,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      questionId: map['questionId'],
      title: map['title'],
      difficulty: map['difficulty'],
      courseId: map['courseId'],
      timelimite: map['timelimite'],
      weight: map['weight'],
      questionType: map['questionType'],
      examOnly: map['examOnly'],
      content: map['content'],
      explanation: map['explanation'],
      comment: map['comment'],
      addedBy: map['addedBy'],
      in_question_bank: map['in_question_bank'],
      status: map['status'],
      correctAnswerText: map['correctAnswerText'],
      incorrectAnswerText: map['incorrectAnswerText'],
      caseSensitive: map['caseSensitive'],
      created: map['created'],
      modified: map['modified'],
      timeStamp: map['timeStamp'],
      answers: List<Answer>.from(map['choices']?.map((x) => Answer.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source));
}
