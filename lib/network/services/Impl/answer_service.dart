import 'package:demo3/model/answer.dart';
import 'package:demo3/network/services/IAnswer_repository.dart';

class AnswerService extends IAnswerRepository{

  List<Answer> fetchAnswerByQuestionId(int id){
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