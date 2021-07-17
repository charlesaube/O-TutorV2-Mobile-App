import 'dart:convert';
import 'dart:io';
import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/secure_storage.dart';
import 'package:http/http.dart' as http;

import 'api_exceptions.dart';

class ApiClient {

  final String _baseUrl = SecureStorage.apiUrl;

  Future<Map<String, String>> fetchHeaders([String? type]) async {
    var token = await SecureStorage.getAuthToken();
    var collegeId = await SecureStorage.getCollegeId();
    if (collegeId == null || token == null)
      {
        collegeId = '';
        token = '';
      }
    if (type == "College")
      {
        Map<String, String> headers = {
          "Accept": "application/json",
          "X-Secret": "KUKVtR2yPbtXfz0ho2xGDABPMETujuYov0tFzKIl",
          "Accept-Language": "",
          "debug": "false",
        };
        return headers;
      }
    Map<String, String> headers = {
      "Accept": "application/json",
      "X-Secret": "KUKVtR2yPbtXfz0ho2xGDABPMETujuYov0tFzKIl",
      "Accept-Language": "",
      "debug": "false",
      "X-College-Id": /*collegeId*/ "40",//hardcoded parceque c'est le seul id fonctionnel pour le logout
      "authorization-token": token,
    };
    print("Token: " + token);
    return headers;
  }

  Future<dynamic> get(String url, [String? type]) async {
    var responseJson;
    try {
      final response =
          await http.get(Uri.parse(_baseUrl + url), headers: await fetchHeaders(type));
      responseJson = _returnResponse(response);
    } on SocketException catch (e) {
      print(e);
      throw FetchDataException('No internet');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    var responseJson;
    try {
      final response = await http.post(Uri.parse(_baseUrl + url),
          body: jsonEncode(body), headers: await fetchHeaders());
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var responseJson;
    try {
      final response =
          await http.delete(Uri.parse(_baseUrl + url), headers: await fetchHeaders());
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson;
        if (response.body.isNotEmpty) {
          responseJson = json.decode(response.body.toString());
        } else {
          responseJson = response.statusCode.toString();
        }
        return responseJson;
      case 400:
        throw BadRequestException(
            response.body.toString() + response.statusCode.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}  ${response.body}');
    }
  }
}
