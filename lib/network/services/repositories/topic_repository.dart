import 'dart:io';

import 'package:demo3/model/topic.dart';
import 'package:demo3/network/services/ITopic_repository.dart';
import 'package:http/http.dart' as http;

import '../../api_client.dart';
import '../../api_exceptions.dart';

class TopicRepository implements ITopicRepository {
  ApiClient _helper = new ApiClient();

  @override
  Future<List<Topic>> fetchTopicsByGroupId(int groupId) async {
    http.Response response;
    var responseJson;
    try {
      response = await http.get(
        Uri.parse("http://8g9dz.mocklab.io/group/" + groupId.toString() + "/topics"),
      );
      responseJson = _helper.returnResponse(response);
    } on SocketException catch (e) {
      print(e);
      print(responseJson);
      throw FetchDataException('No internet');
    }
    var topicsObjJson = responseJson as List;
    List<Topic> topics = List<Topic>.from(topicsObjJson.map((quizJson) => Topic.fromJson(quizJson)));
    print(topics);
    return topics;
  }
}
