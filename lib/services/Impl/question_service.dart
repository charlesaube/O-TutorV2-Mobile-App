import 'package:demo3/model/question.dart';
import 'package:demo3/services/Impl/answer_service.dart';

class QuestionService {
  AnswerService answerService = new AnswerService();

  List<Question> getQuestionByQuizId(int id) {

    Question q1 = new Question("Que Font 2 + 2?", 1, 1, answerService.getAnswerByQuestionId(1));
    List<Question> questions = [];

    return questions;
  }
}
