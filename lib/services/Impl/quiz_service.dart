import 'package:demo3/model/quiz.dart';

class QuizService {

  List<Quiz> getQuizByCategory(String categoryName) {
    Quiz q1 = new Quiz.basic("Titre", "Easy");
    Quiz q2 = new Quiz.basic("Titre", "Hard");
    Quiz q3 = new Quiz.basic("Titre", "Expert");
    Quiz q4 = new Quiz.basic("Titre", "Easy");

    List<Quiz> quizList = [];
    quizList.add(q1);
    quizList.add(q2);
    quizList.add(q3);
    quizList.add(q4);

    return quizList;
  }
}