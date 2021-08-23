import 'package:demo3/model/question.dart';

import 'question_attempt.dart';

class SelfAssessment {
  int id;
  int courseId;
  List<String> topics;
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
    dynamic topics = json["topics"];
    dynamic duration = json["duration"];
    dynamic timelimit = json["timelimit"];
    dynamic isOver = json["is_over"];
    dynamic totalQuestions = json["total_questions"];
    dynamic currentQuestionId = json["current_question_id"];

    var groupObjJson = json['question_attempts'] as List;
    List<QuestionAttempt> questionAttempts =
        List<QuestionAttempt>.from(groupObjJson.map((groupJson) => QuestionAttempt.fromJson(groupJson)));
    groupObjJson = json['questions'] as List;
    List<Question> questions = List<Question>.from(groupObjJson.map((groupJson) => Question.fromJson(groupJson)));

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
}
