import 'dart:async';

import 'package:demo3/model/quiz.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';

class QuizBloc{
  late IQuizRepository _quizRepository;

  var _quizController = StreamController<ApiResponse<Quiz>>();
  StreamSink<ApiResponse<Quiz>> get quizSink => _quizController.sink;

  Stream<ApiResponse<Quiz>> get quizStream => _quizController.stream;

  var _quizzesController = StreamController<ApiResponse<List<Quiz>>>();
  StreamSink<ApiResponse<List<Quiz>>> get quizzesSink => _quizzesController.sink;

  Stream<ApiResponse<List<Quiz>>> get quizzesStream => _quizzesController.stream;


  QuizBloc(){
    _quizController = StreamController<ApiResponse<Quiz>>();
    _quizRepository = ServiceProvider().fetchQuizRepository();
    _quizzesController = StreamController<ApiResponse<List<Quiz>>>();
  }

  fetchQuizById(int id) async{
    quizSink.add(ApiResponse.loading('Fetching quiz'));
    try {
      Quiz quiz = await _quizRepository.fetchQuizById(id);
      quizSink.add(ApiResponse.completed(quiz));
    } catch (e) {
      quizSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  fetchQuizByCategory(int categoryId) async{
    quizSink.add(ApiResponse.loading('Authenticating'));
    try {
      Quiz quiz = await _quizRepository.fetchQuizByCategoryId(categoryId);
      quizSink.add(ApiResponse.completed(quiz));
    } catch (e) {
      quizSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose(){
    _quizController.close();
    _quizzesController.close();
  }

}