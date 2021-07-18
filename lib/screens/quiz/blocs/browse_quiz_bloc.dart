import 'dart:async';

import 'package:demo3/model/quiz.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';

class BrowseQuizBloc{

  late IQuizRepository _quizRepository;


  var _quizListController = StreamController<ApiResponse<List<Quiz>>>();
  StreamSink<ApiResponse<List<Quiz>>> get quizListSink => _quizListController.sink;

  Stream<ApiResponse<List<Quiz>>> get quizListStream => _quizListController.stream;


  BrowseQuizBloc(int groupId){
    _quizListController = StreamController<ApiResponse<List<Quiz>>>();
    _quizRepository = ServiceProvider().fetchQuizRepository();
    fetchQuizByGroupId(groupId);
  }

  fetchQuizByGroupId(int groupId) async{
    quizListSink.add(ApiResponse.loading('fetching quiz by group id'));
    try {
      List<Quiz> quizzes = await _quizRepository.fetchQuizByGroupId(groupId);
      quizListSink.add(ApiResponse.completed(quizzes));
    } catch (e) {
      quizListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose(){
    _quizListController.close();
  }

}