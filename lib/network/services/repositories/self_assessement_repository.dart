import 'dart:convert';
import 'dart:io';

import 'package:demo3/model/self_assessment.dart';
import 'package:demo3/network/services/ISelf_assessments_repository.dart';
import 'package:http/http.dart' as http;

import '../../api_client.dart';
import '../../api_exceptions.dart';

class SelfAssessmentRepository extends ISelfAssesmentsRepository {
  ApiClient _helper = new ApiClient();

  @override
  Future<SelfAssessment> createSelfAssesment(Map<String, dynamic> body) async {
    http.Response response;
    var responseJson;
    try {
      response = await http.post(Uri.parse("http://8g9dz.mocklab.io//self-assessments"), body: jsonEncode(body));
      responseJson = _helper.returnResponse(response);
    } on SocketException catch (e) {
      print(e);
      throw FetchDataException('No internet');
    }
    print("create self assessment response:");
    print(responseJson);
    SelfAssessment selfAssessment = SelfAssessment.fromJson(responseJson);

    return selfAssessment;
  }
}
