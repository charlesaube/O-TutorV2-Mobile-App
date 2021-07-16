import 'dart:async';

import 'package:demo3/model/question.dart';
import 'package:demo3/model/quiz.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/IQuestion_repository.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';

class QuestionBloc{
  late IQuestionRepository _questionRepository;

  var _questionController = StreamController<ApiResponse<List<Question>>>();
  StreamSink<ApiResponse<List<Question>>> get questionSink => _questionController.sink;

  Stream<ApiResponse<List<Question>>> get questionStream => _questionController.stream;

  QuestionBloc(){
    _questionController = StreamController<ApiResponse<List<Question>>>();
    _questionRepository = ServiceProvider().fetchQuestionRepository();
  }

  fetchQuestionByQuizId(int id) async{
    questionSink.add(ApiResponse.loading('Fetching quiz'));
    try {
      List<Question> questions = await _questionRepository.fetchQuestionByQuizId(id);
      questionSink.add(ApiResponse.completed(questions));
    } catch (e) {
      questionSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }


  dispose(){
    _questionController.close();
  }

}