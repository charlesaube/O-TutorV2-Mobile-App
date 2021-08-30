import 'dart:async';

import 'package:demo3/model/topic.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/ITopic_repository.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';

class SelfAssessmentFormBloc {
  late ITopicRepository _topicRepository = ServiceProvider().fetchTopicRepository();

  var _topicsController = StreamController<ApiResponse<List<Topic>>>();
  StreamSink<ApiResponse<List<Topic>>> get topicsSink => _topicsController.sink;
  Stream<ApiResponse<List<Topic>>> get topicsStream => _topicsController.stream;

  selfAssessmentBloc() {
    _topicsController = StreamController<ApiResponse<List<Topic>>>();
    _topicRepository = ServiceProvider().fetchTopicRepository();
  }

  getTopicsByGroupId(int groupId) async {
    topicsSink.add(ApiResponse.loading('Fetching'));
    List<Topic>? topics;
    try {
      topics = await _topicRepository.fetchTopicsByGroupId(groupId);
      topicsSink.add(ApiResponse.completed(topics));
    } catch (e) {
      topicsSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
    return topics;
  }
}
