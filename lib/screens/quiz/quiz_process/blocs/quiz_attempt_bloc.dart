import 'dart:async';

import 'package:demo3/model/quiz.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';

class QuizAttemptBloc {
  late IQuizRepository _quizRepository;

  // var _quizController = StreamController<ApiResponse<Quiz>>();
  // StreamSink<ApiResponse<Quiz>> get quizSink => _quizController.sink;
  // Stream<ApiResponse<Quiz>> get quizStream => _quizController.stream;
  // var _quizListController = StreamController<ApiResponse<List<Quiz>>>();
  // StreamSink<ApiResponse<List<Quiz>>> get quizListSink => _quizListController.sink;
  // Stream<ApiResponse<List<Quiz>>> get quizListStream => _quizListController.stream;

  var _quizAttemptController = StreamController<ApiResponse<QuizAttempt>>();
  StreamSink<ApiResponse<QuizAttempt>> get quizAttemptSink => _quizAttemptController.sink;
  Stream<ApiResponse<QuizAttempt>> get quizAttemptStream => _quizAttemptController.stream;

  // QuizBloc(int categoryId) {
  //   _quizController = StreamController<ApiResponse<Quiz>>();
  //   _quizListController = StreamController<ApiResponse<List<Quiz>>>();
  //   _quizRepository = ServiceProvider().fetchQuizRepository();
  //   fetchQuizByCategoryId(categoryId);
  // }

  QuizAttemptBloc(int quizId) {
    _quizAttemptController = StreamController<ApiResponse<QuizAttempt>>();
    _quizRepository = ServiceProvider().fetchQuizRepository();

    createQuizAttempt(quizId);
  }

  // fetchQuizById(int id) async {
  //   quizSink.add(ApiResponse.loading('Fetching quiz'));
  //   try {
  //     Quiz quiz = await _quizRepository.fetchQuizById(id);
  //     quizSink.add(ApiResponse.completed(quiz));
  //   } catch (e) {
  //     quizSink.add(ApiResponse.error(e.toString()));
  //     print(e);
  //   }
  // }

  // fetchQuizByCategoryId(int categoryId) async {
  //   quizListSink.add(ApiResponse.loading('Fetching'));
  //   try {
  //     List<Quiz> quizzes = await _quizRepository.fetchQuizByGroupId(categoryId);
  //     quizListSink.add(ApiResponse.completed(quizzes));
  //   } catch (e) {
  //     quizListSink.add(ApiResponse.error(e.toString()));
  //     print(e);
  //   }
  // }

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
    // _quizListController.close();
  }
}
