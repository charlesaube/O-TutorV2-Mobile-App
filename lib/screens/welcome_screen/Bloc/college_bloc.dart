import 'dart:async';

import 'package:demo3/model/college.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/repositories/college_repository.dart';

class CollegeBloc {
  late CollegeRepository _collegeRepository;

  var _collegeListController = StreamController<ApiResponse<List<College>>>();
  StreamSink<ApiResponse<List<College>>> get collegeListSink =>
      _collegeListController.sink;

  Stream<ApiResponse<List<College>>> get collegeListStream =>
      _collegeListController.stream;

  CollegeBloc() {
    _collegeListController = StreamController<ApiResponse<List<College>>>();
    _collegeRepository = CollegeRepository();
    fetchColleges();
  }

  fetchColleges() async {
    collegeListSink.add(ApiResponse.loading('Fetching Categories'));
    try {
      List<College> colleges = await _collegeRepository.fetchColleges();
      collegeListSink.add(ApiResponse.completed(colleges));
    } catch (e) {
      collegeListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _collegeListController.close();
  }
}
