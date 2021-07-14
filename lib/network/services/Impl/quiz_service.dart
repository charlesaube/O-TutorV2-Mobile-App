import 'package:demo3/model/quiz.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';

class QuizService extends IQuizRepository{

  List<Quiz> fetchQuizByCategory(String categoryName) {
    Quiz q1 = new Quiz.basic("Titre", "Easy",1);
    Quiz q2 = new Quiz.basic("Titre", "Hard",2);
    Quiz q3 = new Quiz.basic("Titre", "Expert",3);
    Quiz q4 = new Quiz.basic("Titre", "Easy",4);

    List<Quiz> quizList = [];
    quizList.add(q1);
    quizList.add(q2);
    quizList.add(q3);
    quizList.add(q4);

    return quizList;
  }

  Quiz fetchQuizById(int id){
    Quiz q1 = new Quiz.basic("Titre", "Easy",1);
    return q1;
  }
}