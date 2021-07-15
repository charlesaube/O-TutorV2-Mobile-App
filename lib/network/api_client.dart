import 'dart:convert';
import 'dart:io';
import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/secure_storage.dart';
import 'package:http/http.dart' as http;

import 'api_exceptions.dart';

class ApiClient {
  final String _baseUrl = SecureStorage.apiUrl;
  //final String _baseUrl = "http://api.themoviedb.org/3/";
  //final String _baseUrl = "https://otutor-f456.restdb.io/rest/";


  Map<String, String> get authHeaders =>
      {
        "Content-Type": "application/json",
      };
  // Map<String, String> get deleteHeaders =>
  //     {
  //       "Content-Type": "application/json",
  //       "Authorization": "Token 4703e9c451e04f99d19fb3e1523e9b7b02c6ad1c" ,
  //     };
  Future<Map<String, String>> fetchHeaders() async{
    final token = await SecureStorage.getAuthToken();
    Map<String, String> headers = {
    "Content-Type": "application/json",
    "Authorization": "Token " + token!,
    };
    return headers;
  }
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response =
      await http.get(Uri.parse(_baseUrl + url), headers: authHeaders);
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
          body: jsonEncode(body), headers: authHeaders);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var responseJson;
    try {
      final header = await fetchHeaders();
      final response = await http.delete(Uri.parse(_baseUrl + url), headers: header);
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
        if(response.body.isNotEmpty) {
          responseJson = json.decode(response.body.toString());
        }
        else{
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
            'Error occured while Communication with Server with StatusCode : ${response
                .statusCode}');
    }
  }
}
