import 'dart:convert';

import 'package:demo3/model/question.dart';
import 'package:demo3/model/question_attempt.dart';

class QuizAttempt {
  int id;
  int quizId;
  String duration;
  bool isOver;
  int currentQuestionId;
  List<int>? questionsOrder;
  List<QuestionAttempt> questionAttempts;
  List<Question> questions;

  QuizAttempt(
      {required this.id,
      required this.quizId,
      required this.duration,
      required this.isOver,
      required this.currentQuestionId,
      this.questionsOrder,
      required this.questionAttempts,
      required this.questions});

  factory QuizAttempt.fromJson(dynamic json) {
    int id = json["id"];
    dynamic quizId = json["quiz_id"];
    dynamic duration = json["duration"];
    dynamic isOver = json["is_over"];
    dynamic currentQuestionId = json["current_question"];
    dynamic questionsOrder = json["questions_order"];
    var groupObjJson = json['question_attempts'] as List;
    List<QuestionAttempt> questionAttempts =
        groupObjJson.map((groupJson) => QuestionAttempt.fromJson(groupJson)).toList();
    groupObjJson = json['questions'] as List;
    List<Question> questions = groupObjJson.map((groupJson) => Question.fromJson(groupJson)).toList();

    return QuizAttempt(
        id: id,
        quizId: quizId,
        duration: duration,
        isOver: isOver,
        currentQuestionId: currentQuestionId,
        questionsOrder: questionsOrder,
        questionAttempts: questionAttempts,
        questions: questions);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'quiz_id': quizId,
        'duration': duration,
        'is_over': isOver,
        'current_question_id': currentQuestionId,
        'questions_order': questionsOrder,
        'question_attempts': jsonEncode(questionAttempts),
      };

  @override
  String toString() {
    return 'QuizAttempt{id: $id, quizId: $quizId, duration: $duration, isOver: $isOver, currentQuestionId: $currentQuestionId, questionsOrder: $questionsOrder, questionAttempts: $questionAttempts, questions: $questions}';
  }
}
