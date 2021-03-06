import 'dart:async';

import 'package:demo3/model/quiz.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';
import 'package:rxdart/rxdart.dart';

class BrowseQuizBloc {
  late IQuizRepository _quizRepository;
  static List<Quiz> _cachedQuizzes = [];
  static List<QuizAttempt> _cachedQuizAttempts = [];
  static Quiz? _cachedQuiz;

  var _quizListController = BehaviorSubject<ApiResponse<List<Quiz>>>();
  StreamSink<ApiResponse<List<Quiz>>> get quizListSink => _quizListController.sink;
  Stream<ApiResponse<List<Quiz>>> get quizListStream => _quizListController.stream;

  var _quizAttemptListController = BehaviorSubject<ApiResponse<List<QuizAttempt>>>();
  StreamSink<ApiResponse<List<QuizAttempt>>> get quizAttemptListSink => _quizAttemptListController.sink;
  Stream<ApiResponse<List<QuizAttempt>>> get quizAttemptListStream => _quizAttemptListController.stream;

  var _quizController = BehaviorSubject<ApiResponse<Quiz>>();
  StreamSink<ApiResponse<Quiz>> get quizSink => _quizController.sink;
  Stream<ApiResponse<Quiz>> get quizStream => _quizController.stream;

  BrowseQuizBloc(int groupId) {
    _quizListController = BehaviorSubject<ApiResponse<List<Quiz>>>();
    _quizAttemptListController = BehaviorSubject<ApiResponse<List<QuizAttempt>>>();
    _quizController = BehaviorSubject<ApiResponse<Quiz>>();

    _quizRepository = ServiceProvider().fetchQuizRepository();
    if (_cachedQuizzes.isEmpty) {
      fetchQuizByGroupId(groupId);
    } else {
      quizListSink.add(ApiResponse.completed(_cachedQuizzes));
    }

    if (_cachedQuizAttempts.isEmpty) {
      fetchQuizAttemptsOfUser();
    } else {
      quizAttemptListSink.add(ApiResponse.completed(_cachedQuizAttempts));
    }
  }

  fetchQuizByGroupId(int groupId) async {
    quizListSink.add(ApiResponse.loading('fetching quiz by group id'));
    try {
      List<Quiz> quizzes = await _quizRepository.fetchQuizByGroupId(groupId);
      _cachedQuizzes = quizzes;
      quizListSink.add(ApiResponse.completed(quizzes));
    } catch (e) {
      quizListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  fetchQuizAttemptsOfUser() async {
    quizAttemptListSink.add(ApiResponse.loading("Fetching quiz attempt of user"));
    try {
      List<QuizAttempt> quizAttempts = await _quizRepository.getQuizAttemptsOfUser();
      _cachedQuizAttempts = quizAttempts;
      quizAttemptListSink.add(ApiResponse.completed(quizAttempts));
    } catch (e) {
      quizAttemptListSink.add(ApiResponse.error(e.toString()));
      print(e);
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
    _quizListController.close();
    _quizAttemptListController.close();
    _quizController.close();
  }
}
