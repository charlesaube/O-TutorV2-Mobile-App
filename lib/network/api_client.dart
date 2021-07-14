import 'dart:convert';
import 'dart:io';
import 'package:demo3/secure_storage.dart';
import 'package:http/http.dart' as http;

import 'api_exceptions.dart';

class ApiClient {
  //final String _baseUrl = SecureStorage.apiUrl;
  final String _baseUrl = "http://api.themoviedb.org/3/";
  //final String _baseUrl = "https://otutor-f456.restdb.io/rest/";

  Map<String, String> get headers => {
    "x-apiKey": "4072e8fd15acedb8caa1e50c72c3821b25d39",
  };

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl + url),
      headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }


  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
