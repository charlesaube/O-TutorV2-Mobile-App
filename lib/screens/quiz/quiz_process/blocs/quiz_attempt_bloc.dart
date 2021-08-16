import 'dart:async';

import 'package:demo3/model/quiz.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';

class QuizAttemptBloc {
  late IQuizRepository _quizRepository;

  var _quizAttemptController = StreamController<ApiResponse<QuizAttempt>>();
  StreamSink<ApiResponse<QuizAttempt>> get quizAttemptSink => _quizAttemptController.sink;
  Stream<ApiResponse<QuizAttempt>> get quizAttemptStream => _quizAttemptController.stream;

  QuizAttemptBloc(int quizId) {
    _quizAttemptController = StreamController<ApiResponse<QuizAttempt>>();
    _quizRepository = ServiceProvider().fetchQuizRepository();

    createQuizAttempt(quizId);
  }

  createQuizAttempt(int quizId) async {
    //Map<String, int> body = {"quiz_id": quizId, "attempt_date": DateTime.now().millisecondsSinceEpoch};
    Map<String, int> body = {"quiz_id": 145, "attempt_date": 1468439182};
    quizAttemptSink.add(ApiResponse.loading('Creating'));
    try {
      QuizAttempt quizAttempt = await _quizRepository.createQuizAttempt(body);
      quizAttemptSink.add(ApiResponse.completed(quizAttempt));
    } catch (e) {
      quizAttemptSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _quizAttemptController.close();
  }
}
