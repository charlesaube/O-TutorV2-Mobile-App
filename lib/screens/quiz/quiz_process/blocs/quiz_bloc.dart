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

  var _quizListController = StreamController<ApiResponse<List<Quiz>>>();
  StreamSink<ApiResponse<List<Quiz>>> get quizListSink => _quizListController.sink;

  Stream<ApiResponse<List<Quiz>>> get quizListStream => _quizListController.stream;


  QuizBloc(int categoryId){
    _quizController = StreamController<ApiResponse<Quiz>>();
    _quizListController = StreamController<ApiResponse<List<Quiz>>>();
    _quizRepository = ServiceProvider().fetchQuizRepository();
    fetchQuizByCategoryId(categoryId);
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

  fetchQuizByCategoryId(int categoryId) async{
    quizListSink.add(ApiResponse.loading('Authenticating'));
    try {
      List<Quiz> quizzes = await _quizRepository.fetchQuizByCategoryId(categoryId);
      quizListSink.add(ApiResponse.completed(quizzes));
    } catch (e) {
      quizListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose(){
    _quizController.close();
    _quizListController.close();
  }

}