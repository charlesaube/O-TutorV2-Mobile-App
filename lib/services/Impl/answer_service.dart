import 'package:demo3/model/Answer.dart';

class AnswerService{
  List<Answer> getAnswerByQuestionId(int id){
    Answer a1 = new Answer(1, "Gazeux", true);
    Answer a2 = new Answer(1, "Liquide", false);
    Answer a3 = new Answer(1, "Solide", false);
    Answer a4 = new Answer(1, "Rocher", false);


    List<Answer> answers = [];
    answers.add(a1);
    answers.add(a2);
    answers.add(a3);

    return answers;
  }
}