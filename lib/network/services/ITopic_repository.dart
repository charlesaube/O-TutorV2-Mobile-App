import 'package:demo3/model/topic.dart';

abstract class ITopicRepository {
  Future<List<Topic>> fetchTopicsByGroupId(int groupId);
}
