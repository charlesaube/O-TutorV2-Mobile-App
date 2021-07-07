import 'Answer.dart';

class Question{
  int questionId;
  int quizId;
  String question;
  List<Answer> answers;
  
  Question(this.question,this.questionId,this.quizId,this.answers);



}