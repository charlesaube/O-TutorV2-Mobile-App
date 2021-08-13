import 'package:demo3/model/answer.dart';

class QuestionAttempt {
  int questionId;
  int isAnswer;
  int obtainedMark;
  bool goodAnswer;
  int answerTime;
  String type;
  String answer;
  List<int> answers;

  QuestionAttempt(this.questionId, this.isAnswer, this.obtainedMark, this.goodAnswer, this.answerTime, this.type,
      this.answer, this.answers);

  factory QuestionAttempt.fromJson(dynamic json) {
    int questionId = json['question_id'];
    int isAnswer = json['is_answer'] as int;
    int obtainedMark = json['obtained_mark'] as int;
    bool goodAnswer = json['good_answer'] as bool;
    int answerTime = json['answer_time'] as int;
    String type = json['type'] as String;
    String answer = "";
    List<int> answers = [];

    if (type == "shortanswer") {
      answer = json['answer'] as String;
    } else {
      answers = json['answers'] as List<int>;
    }

    return QuestionAttempt(questionId, isAnswer, obtainedMark, goodAnswer, answerTime, type, answer, answers);
  }

  Map<String, dynamic> toJson() => {
        'question_id': questionId,
        'is_answer': isAnswer,
        'obtained_mark': obtainedMark,
        'good_answer': goodAnswer,
        'answer_time': answerTime,
        'type': type,
        'answer': answer,
        'answers': answers
      };
}
