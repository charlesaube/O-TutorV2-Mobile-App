import 'dart:async';
import 'package:demo3/model/quiz.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';
import 'package:rxdart/rxdart.dart';

class QuizDetailsBloc {
  late IQuizRepository _quizRepository;
  static Quiz? _cachedQuiz;

  var _quizController = BehaviorSubject<ApiResponse<Quiz>>();
  StreamSink<ApiResponse<Quiz>> get quizSink => _quizController.sink;
  Stream<ApiResponse<Quiz>> get quizStream => _quizController.stream;

  QuizDetailsBloc(int quizId) {
    _quizController = BehaviorSubject<ApiResponse<Quiz>>();

    _quizRepository = ServiceProvider().fetchQuizRepository();
    if (_cachedQuiz == null) {
      fetchQuizById(quizId);
    } else {
      quizSink.add(ApiResponse.completed(_cachedQuiz!));
    }
  }

  fetchQuizById(int id) async {
    quizSink.add(ApiResponse.loading("Fetching quiz by id"));
    try {
      Quiz quiz = await _quizRepository.fetchQuizById(id);
      _cachedQuiz = quiz;
      quizSink.add(ApiResponse.completed(quiz));
    } catch (e) {
      quizSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _quizController.close();
  }
}
