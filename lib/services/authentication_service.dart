import 'dart:io';

import 'package:http/http.dart' as http;

class AuthenticationService {
  String url = "https://jsonplaceholder.typicode.com/albums/1";


  Future<http.Response> authentication(String username, String password ) async{
    final response = await http.get(Uri.parse(url),
    headers: {
      HttpHeaders.authorizationHeader: ""
    });
    print(response.body);
    return http.get(Uri.parse(url));
  }
}