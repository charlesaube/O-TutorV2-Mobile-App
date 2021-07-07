import 'package:demo3/model/Answer.dart';

class AnswerService{
  List<Answer> getAnswerByQuestionId(int id){
    Answer a1 = new Answer(1, "4", true);
    Answer a2 = new Answer(1, "5", false);
    Answer a3 = new Answer(1, "2", false);

    List<Answer> answers = [];
    answers.add(a1);
    answers.add(a2);
    answers.add(a3);

    return answers;
  }
}