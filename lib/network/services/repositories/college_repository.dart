import 'dart:convert';

import 'package:demo3/model/college.dart';
import 'package:demo3/network/api_client.dart';
import 'package:demo3/network/services/ICollege_repository.dart';

class CollegeRepository extends ICollegeRepository{

  ApiClient _helper = new ApiClient();

  @override
  Future<List<College>>fetchColleges() async {
    final response = await _helper.get("/colleges/");
    print(response);
    return CollegeResponse.fromJson(response).results;
  }

}