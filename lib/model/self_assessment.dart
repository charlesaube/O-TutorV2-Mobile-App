import 'package:demo3/model/question.dart';

class SelfAssessment {
  int id;
  int courseId;
  List<Null> topics;
  String duration;
  String timelimit;
  bool isOver;
  int totalQuestions;
  int currentQuestionId;
  List<Question> questionAttempts;
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

  // SelfAssessment.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   courseId = json['course_id'];
  //   if (json['topics'] != null) {
  //     topics = new List<Null>();
  //     json['topics'].forEach((v) {
  //       topics.add(new Null.fromJson(v));
  //     });
  //   }
  //   duration = json['duration'];
  //   timelimit = json['timelimit'];
  //   isOver = json['is_over'];
  //   totalQuestions = json['total_questions'];
  //   currentQuestionId = json['current_question_id'];
  //   if (json['question_attempts'] != null) {
  //     questionAttempts = new List<Null>();
  //     json['question_attempts'].forEach((v) {
  //       questionAttempts.add(new Null.fromJson(v));
  //     });
  //   }
  //   if (json['questions'] != null) {
  //     questions = new List<Null>();
  //     json['questions'].forEach((v) {
  //       questions.add(new Null.fromJson(v));
  //     });
  //   }
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['course_id'] = this.courseId;
  //   if (this.topics != null) {
  //     data['topics'] = this.topics.map((v) => v.toJson()).toList();
  //   }
  //   data['duration'] = this.duration;
  //   data['timelimit'] = this.timelimit;
  //   data['is_over'] = this.isOver;
  //   data['total_questions'] = this.totalQuestions;
  //   data['current_question_id'] = this.currentQuestionId;
  //   if (this.questionAttempts != null) {
  //     data['question_attempts'] =
  //         this.questionAttempts.map((v) => v.toJson()).toList();
  //   }
  //   if (this.questions != null) {
  //     data['questions'] = this.questions.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
