import 'package:demo3/model/question.dart';
import 'package:demo3/services/Impl/answer_service.dart';

class QuestionService {
  AnswerService answerService = new AnswerService();

  List<Question> getQuestionByQuizId(int id) {

    Question q1 = new Question("Sous qu'elle forme l'eau ne peut pas être?", 1, 1, answerService.getAnswerByQuestionId(1));
    Question q2 = new Question("Que Font 4 + 2?", 1, 1, answerService.getAnswerByQuestionId(1));
    List<Question> questions = [];
    questions.add(q1);
    questions.add(q2);

    return questions;
  }
}
