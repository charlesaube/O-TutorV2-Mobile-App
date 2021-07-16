import 'answer.dart';

class Question{
  int questionId;
  int quizId;
  String question;
  List<Answer> answers;
  
  Question(this.question,this.questionId,this.quizId,this.answers);

  factory Question.fromJson(dynamic json){

    int questionId = json['question_id'] as int;
    int quizId = json['quiz_id'] as int;
    String question = json['question'] as String;

    var answerObjJson = json['answers']  as List;
    List<Answer> answers = answerObjJson.map((answerJson) => Answer.fromJson(answerJson)).toList();

    return Question(question, questionId, quizId, answers);

  }



}