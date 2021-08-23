import 'dart:convert';

import 'package:demo3/model/question.dart';
import 'package:demo3/model/question_attempt.dart';

class QuizAttempt {
  int id;
  int quizId;
  String duration;
  bool isOver;
  int currentQuestionId;
  List<int> questionsOrder;
  List<QuestionAttempt> questionAttempts;
  List<Question> questions;

  QuizAttempt(
      {required this.id,
      required this.quizId,
      required this.duration,
      required this.isOver,
      required this.currentQuestionId,
      required this.questionsOrder,
      required this.questionAttempts,
      required this.questions});

  factory QuizAttempt.fromJson(dynamic json) {
    int id = json["id"];
    dynamic quizId = json["quiz_id"];
    dynamic duration = json["duration"];
    dynamic isOver = json["is_over"];
    dynamic currentQuestionId = json["current_question"];

    List<int> questionsOrder = [];
    if (json["questions_order"] != null) {
      //Si provient de requete create quiz attempt il n'y a pas de question_order
      questionsOrder = json["questions_order"].cast<int>();
    }

    var groupObjJson = json['question_attempts'] as List;
    List<QuestionAttempt> questionAttempts =
        List<QuestionAttempt>.from(groupObjJson.map((groupJson) => QuestionAttempt.fromJson(groupJson)));
    groupObjJson = json['questions'] as List;
    List<Question> questions = List<Question>.from(groupObjJson.map((groupJson) => Question.fromJson(groupJson)));

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
        'quiz_id:': quizId,
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

  //Retourne le score du quiz
  double computeScore() {
    int scoredPoints = 0;
    int maxPoints = 0;
    for (Question q in this.questions) {
      maxPoints += q.weight;
    }
    for (QuestionAttempt qa in this.questionAttempts) {
      if (qa.goodAnswer) {
        scoredPoints += qa.obtainedMark;
      }
    }
    return scoredPoints / maxPoints;
  }

  //Retourne le nombre de questions non répondu
  int getNumOfQuestionsLeft() {
    return this.questions.length - this.questionAttempts.length;
  }

  //Retourne le pourcentage de completion du quiz
  double getCompletionRate() {
    int numberOfQuestions = this.questions.length;
    int numberOfAnsweredQuestions = this.questionAttempts.length;
    return numberOfAnsweredQuestions / numberOfQuestions;
  }

  //Retourne le temps écoulés depuis le début du quiz
  String getEllapsedTime() {
    int duration = 0;
    for (QuestionAttempt q in this.questionAttempts) {
      duration = duration + q.answerTime;
    }
    return Duration(seconds: duration).toString().substring(2, 7);
  }
}
