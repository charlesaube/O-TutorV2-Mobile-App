import 'package:demo3/model/question.dart';
import 'package:demo3/network/services/IAnswer_repository.dart';
import 'package:demo3/network/services/IQuestion_repository.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';

class QuestionService extends IQuestionRepository{
  IAnswerRepository answerService = ServiceProvider().getAnswerService();

  List<Question> fetchQuestionByQuizId(int id) {

    Question q1 = new Question("Sous qu'elle forme l'eau ne peut pas être?", 1, 1, answerService.fetchAnswerByQuestionId(1));
    Question q2 = new Question("Que Font 4 + 2?", 1, 1, answerService.fetchAnswerByQuestionId(1));
    List<Question> questions = [];
    questions.add(q1);
    questions.add(q2);

    return questions;
  }
}
