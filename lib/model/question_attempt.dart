import 'package:demo3/model/answer.dart';

class QuestionAttempt {
  int questionId;
  int isAnswer;
  int obtainedMark;
  bool goodAnswer;
  int answerTime;
  String type;
  String answer;
  List<int>? answers;

  QuestionAttempt(
      this.questionId, this.isAnswer, this.obtainedMark, this.goodAnswer, this.answerTime, this.type, this.answer,
      [this.answers]);

  factory QuestionAttempt.fromJson(dynamic json) {
    int questionId = json['question_id'];
    int isAnswer = json['is_answer'];
    int obtainedMark = json['obtained_mark'];
    bool goodAnswer = json['good_answer'];
    int answerTime = json['answer_time'];
    String type = json['type'];
    String answer = "";
    List<int> answers = [];

    if (type == "shortanswer") {
      answer = json['answer'];
    } else {
      var groupObjJson = json['answers'].cast<int>();
      print(groupObjJson);
      answers = List<int>.from(groupObjJson);
    }

    return QuestionAttempt(questionId, isAnswer, obtainedMark, goodAnswer, answerTime, type, answer, answers);
  }
  @override
  String toString() {
    return "Is Answer: ${this.isAnswer} obtained mark: ${this.obtainedMark} goodAnswer: ${this.goodAnswer} answerTime: ${this.answerTime} ";
  }

  Map<String, dynamic> toJson() => {
        'question_id': questionId,
        'is_answer': isAnswer,
        'obtained_mark': obtainedMark,
        'good_answer': goodAnswer,
        'answer_time': answerTime,
        'type': type,
        'answer': answer
      };
}
